class User < ApplicationRecord
  attr_accessor :login, :regenerate_secret
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  has_many :gateways
  validates :email, :name, :presence => true, :uniqueness => { :case_sensitive => false }
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  enum role: {
  	admin: 0,
  	merchant: 1
  }

  enum updates_email_subscription_level: {
    never: 1,
    regular: 2,
    important: 3,
    critical: 4
  }
  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  def self.authenticate(login, password)
    user = User.find_by('name = ? or email = ?', login,  login)
    user&.valid_password?(password) ? user : nil
  end
end
