class TosController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def index
  	@title = 'Tos'
  end
end
