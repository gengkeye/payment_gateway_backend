class Users::SessionsController < Devise::SessionsController
  layout 'devise'
  # skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  skip_before_action :verify_signed_out_user, only: :destroy
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   if user = User.authenticate(params[:user][:login], params[:user][:password])
  #     # 將使用者的 ID 存在 Session，供之後的 Request 使用。
  #     session[:current_user_id] = user.id
  #     redirect_to user_root_path
  #   else
  #     return redirect_to request.referer, alert: 'Login Failed.'
  #   end
  # end

  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in)
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   session[:current_user_id] = nil
  #   redirect_to root_path
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end
