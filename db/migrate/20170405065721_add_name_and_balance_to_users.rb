class AddNameAndBalanceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :balance_of_btc, :decimal, default: 0.0
  end
end
