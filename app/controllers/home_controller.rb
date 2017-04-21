class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  	skip_authorization
  	skip_policy_scope
  	redirect_to user_root_path if current_user.present?
  end
end
