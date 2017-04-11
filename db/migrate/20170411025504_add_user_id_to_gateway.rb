class AddUserIdToGateway < ActiveRecord::Migration[5.0]
  def change
    add_column :gateways, :user_id, :integer, after: :id
    add_column :gateways, :balance_of_btc, :decimal, default: 0.0
  end
end
