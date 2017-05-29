class TosController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def index
  	skip_authorization
  	skip_policy_scope
  	I18n.locale == 'cn' ? (render 'index_cn') : (render 'index_zh-CN')
  end
end
