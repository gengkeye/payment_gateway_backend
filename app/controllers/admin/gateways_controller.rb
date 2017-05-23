module Admin
class GatewaysController < ApplicationController
  layout 'admin'

  before_action :search_gateway, only: [:index]

  def index
  	respond_to do |format|
  	  format.html do
  		  @gateways = @gateways.page params[:page]
  	  end

  	  format.xlsx do
  	    headers['Content-Disposition'] = "attachment; filename=\"gateways_#{Time.current.to_i}.xlsx\""
  	    headers['Content-Type'] ||= 'application/xls'
  	  end

      format.csv { send_data @gateways.to_csv, filename: "gateways_#{Time.current.to_i}" }
      format.json { send_data @gateways.to_json, filename: "gateways_#{Time.current.to_i}" }
      format.xml { send_data @gateways.to_xml, filename: "gateways_#{Time.current.to_i}" }
  	end
  end

  def search_gateway
  	@gateways = policy_scope(Gateway).order('id desc')
    @gateways = @gateways.where(active: params[:active]) unless params[:active].blank?
    @gateways = @gateways.where(test_mode: params[:test_mode]) unless params[:test_mode].blank?
    @gateways = @gateways.where(default_currency: params[:default_currency]) unless params[:default_currency].blank?
  end

  def new
    @gateway =  Gateway.new
    @providers = Gateway::EXCHANGE_RATE_ADAPTER.map{|i| [I18n.t("activerecord.attributes.gateway.enum.exchange_rate_adapter_names.#{i}"), i]}
    authorize @gateway
  end

  def edit
    @gateway = Gateway.find_by(uid: params[:id])
    @providers = @gateway.exchange_rate_adapter_nams.split(',').map{|i| [I18n.t("activerecord.attributes.gateway.enum.exchange_rate_adapter_names.#{i}"), i]}
  end

  def create
    @gateway = current_user.gateways.new(gateway_params)
    authorize @gateway
    @gateway.user = current_user
    @gateway.check_signature = params[:test_mode]
    @gateway.secret = current_user.api_secret
    @gateway.exchange_rate_adapter_names = [params[:exchange_rate_adapter_name_1], params[:exchange_rate_adapter_name_2], params[:exchange_rate_adapter_name_3]].join(',')
    if @gateway.save
       return redirect_to admin_gateways_path
    else
       return redirect_back fallback_location: root_path,  notice: @gateway.errors
    end
  end

  private 

  def gateway_params
     params.require(:gateway).permit(:name, :confirmations_required, :pubkey, :default_currency, :callback_url, :exchange_rate_adapter_name_1, :exchange_rate_adapter_name_2, :exchange_rate_adapter_name_3, :orders_expiration_period, 
                                     :orders_expiration_period, :address_derivation_scheme, :test_mode, :test_pubkey, :after_payment_redirect_to, :auto_redirect, :merchant_url,
                                     :allow_links, :back_url, :custom_css_url, :donation_mode, :country, :region, :city, :description, :convert_currency_to, :receive_payments_notifications)
  end
 
end
end