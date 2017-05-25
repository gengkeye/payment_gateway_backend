class RemoveUidFromOrdersAndGateways < ActiveRecord::Migration[5.0]
  def change
  	remove_column :gateways, :uid
  	remove_column :orders, :uid
  	add_column :orders, :customer_uid, :string 
  end
end
