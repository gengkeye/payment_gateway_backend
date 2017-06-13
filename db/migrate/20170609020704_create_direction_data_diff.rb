class CreateDirectionDataDiff < ActiveRecord::Migration[5.0]
  def change
    create_table :direction_data_diffs do |t|
    	t.float :amount_diff
    	t.float :total_value_diff
    	t.integer :diff_base
    	t.timestamps null: false
    end
  end
end
