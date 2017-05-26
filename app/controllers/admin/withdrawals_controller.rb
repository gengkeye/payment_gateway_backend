module Admin
class WithdrawalsController < ApplicationController
  layout 'admin'

  before_action :search_withdrawal, only: [:index]

  def index
  	respond_to do |format|
  	  format.html do
  		  @withdrawals = @withdrawals.page params[:page]
  	  end

  	  format.xlsx do
  	    headers['Content-Disposition'] = "attachment; filename=\"withdrawals_#{Time.current.to_i}.xlsx\""
  	    headers['Content-Type'] ||= 'application/xls'
  	  end
      # format.csv { send_data @withdrawals.to_csv, filename: "withdrawals_#{Time.current.to_i}" }
      format.json { send_data @withdrawals.to_json, filename: "withdrawals_#{Time.current.to_i}" }
      format.xml { send_data @withdrawals.to_xml, filename: "withdrawals_#{Time.current.to_i}" }
  	end
  end

  def enable
  end

  def disable
  end

  private

  def search_withdrawal
  	@withdrawals = policy_scope(Withdrawal).order('id desc')
    @withdrawals = @withdrawals.joins(:gateway).where(test_mode: params[:gateway_name]) unless params[:gateway_name].blank?
    @withdrawals = @withdrawals.where(status: params[:status]) unless params[:status].blank?
  end
end
end
