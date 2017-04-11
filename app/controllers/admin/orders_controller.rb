module Admin
class OrdersController < ApplicationController
  require 'prawn'
  require 'prawn/table'
  layout 'admin'

  before_action :search_order, only: [:index]

  def index
  	respond_to do |format|
	  format.html do
		@orders = @orders.page(params[:page] || 1)
	  end
  	  format.xls do
  	    headers['Content-Disposition'] = "attachment; filename=\"orders_#{Time.current.to_i}.xls\""
  	    headers['Content-Type'] ||= 'application/xls'
  	  end
  	  format.xlsx do
  	    headers['Content-Disposition'] = "attachment; filename=\"orders_#{Time.current.to_i}.xlsx\""
  	    headers['Content-Type'] ||= 'application/xls'
  	  end
  	  format.pdf { render pdf: generate_pdf(@orders)}
  	end
  end

  def search_order
  	@orders = policy_scope(Order).order('orders.id desc')
    @orders = @orders.where(status: params[:statuses].split(','))
  end
 
  private

  def generate_pdf(orders)
    Prawn::Document.new do
      orders.each do |order|
	      text order.address, align: :center
	      text order.status, align: :center
	      text order.amount, align: :center
	      text order.amount_paid, align: :center
	      text order.amount_with_currency, align: :center
	      text order.gateway_id, align: :center
	      text order.created_at, align: :center
	   end
    end.render
  end
end
end