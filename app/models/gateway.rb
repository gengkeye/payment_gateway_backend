class Gateway < ApplicationRecord
	include Uid
	
	attr_accessor :exchange_rate_adapter_name_1, :exchange_rate_adapter_name_2, :exchange_rate_adapter_name_3

	belongs_to :user
	has_many :orders
	validates_presence_of :name, :confirmations_required, :pubkey, :secret, :check_signature
    validates_inclusion_of :test_mode, :active, :allow_links, :donation_mode, :receive_payments_notifications, in: [true, false]
    # before_save :set_user
    # after_create :set_secret

	BTC_UNITS = %w( BTC mBTC uBTC)
	SUPPORT_CURRENCIES = %w(CNY PHP USD)
	EXCHANGE_RATE_ADAPTER = %w(Huobi Okcoin Btcchina)
	SUPPORT_COUNTRIES = %w(China America Philippines)

	private

	# def set_user
	#    self.user = current_user
	#    self.check_signature = self.test_mode
	# end

	# def set_secret
	# 	self.secret = self.user.api_secret
	# 	save
	# end
end