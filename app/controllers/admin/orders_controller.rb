module Admin
class OrdersController < ApplicationController
  layout 'admin'

  before_action :search_order, only: [:index]

  def index
  	respond_to do |format|
  	  format.html do
  		  @orders = @orders.page params[:page]
  	  end

  	  format.xlsx do
  	    headers['Content-Disposition'] = "attachment; filename=\"orders_#{Time.current.to_i}.xlsx\""
  	    headers['Content-Type'] ||= 'application/xls'
  	  end

      format.csv { send_data @orders.to_csv, filename: "orders_#{Time.current.to_i}" }
      format.json { send_data @orders.to_json, filename: "orders_#{Time.current.to_i}" }
      format.xml { send_data @orders.to_xml, filename: "orders_#{Time.current.to_i}" }
  	end
  end

  def search_order
  	@orders = policy_scope(Order).order('orders.id desc')
    @orders = @orders.where(status: params[:statuses].split(',')) unless params[:statuses].blank?
  end
end
end