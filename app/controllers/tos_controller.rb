class TosController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def index
  	skip_authorization
  	skip_policy_scope
  end
end
