class Admin::UsersController < ApplicationController
  layout 'admin'
	
  def edit
  	@user = current_user
  	authorize @user
  end

  def update
  	@user = current_user
  	authorize @user
  	return redirect_to request.referer, alert: I18n.t("alerts.input_password") if user_params[:current_password].blank?

    @user.api_secret = SecureRandom.hex(64) if user_params[:regenerate_secret] == '1' || 
                                                      (user_params[:toggle_dev_api] == '1' && @user.api_secret.blank?)

    @user.api_secret = nil if user_params[:toggle_dev_api] == '0'
    if @user.update_with_password(user_params)
      return redirect_to request.referer, notice: I18n.t("notices.update_success")
    else
      return redirect_to request.referer, alert: @user.errors
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :current_password, :password_confirmation, :toggle_dev_api, :regenerate_secret, :updates_email_subscription_level)
  end
end
