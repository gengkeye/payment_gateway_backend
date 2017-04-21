class Admin::UsersController < ApplicationController
  layout 'admin'
	
  def edit
  	@user = current_user
  	authorize @user
  end

  def update
  	@user = current_user
  	authorize @user
  	return redirect_to request.referer, alert: 'Please input your current password.' if user_params[:current_password].blank?

    @user.update api_secret: SecureRandom.hex(64) if user_params[:regenerate_secret] == '1' || 
                                                      (user_params[:toggle_dev_api] == '1' && @user.api_secret.blank?)

    @user.update api_secret: nil if user_params[:toggle_dev_api] == '0'
       
    

    if @user.update_with_password(user_params)
      return redirect_to request.referer, notice: 'Update successfully.'
    else
      return redirect_to request.referer, alert: @user.errors
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :current_password, :password_confirmation, :toggle_dev_api, :regenerate_secret, :updates_email_subscription_level)
  end
end
