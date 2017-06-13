class AddTwoColumnsToDirectionDiff < ActiveRecord::Migration[5.0]
  def change
  	add_column :direction_data_diffs, :amount_sell, :float
  	add_column :direction_data_diffs, :amount_buy, :float
  end
end
