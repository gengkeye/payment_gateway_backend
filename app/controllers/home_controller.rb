class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  	skip_authorization
  	skip_policy_scope
  end
end
