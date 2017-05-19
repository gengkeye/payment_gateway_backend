class AddUidToUsersGatewaysOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :uid, :string, after: :id
  	add_column :orders, :uid, :string, after: :id
  	add_column :gateways, :uid, :string, after: :id

  end
end
