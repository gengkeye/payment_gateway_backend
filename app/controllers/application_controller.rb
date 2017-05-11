class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  # config pundit
  include Pundit
  after_action :verify_authorized, except: :index, unless: -> { devise_controller? || docs_controller? || introduction_controller? }
  after_action :verify_policy_scoped, only: :index, unless: -> { devise_controller? || docs_controller? || introduction_controller? }
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_locale


  # devise
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :name, :password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs.push(:current_password)
  end

  def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

  def introduction_controller?
    is_a?(::IntroductionsController)
  end

  def docs_controller?
    is_a?(::DocsController)
  end
end
