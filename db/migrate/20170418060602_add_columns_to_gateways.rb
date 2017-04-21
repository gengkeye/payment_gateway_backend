class AddColumnsToGateways < ActiveRecord::Migration[5.0]
  def change
  	add_column :gateways, :country, :string
  	add_column :gateways, :region, :string
  	add_column :gateways, :city, :string
  	add_column :gateways, :description, :text
  	add_column :gateways, :convert_currency_to, :string, default: 'BTC'
  	add_column :gateways, :receive_payments_notifications, :boolean, default: false
  end
end
