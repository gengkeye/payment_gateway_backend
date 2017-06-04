class CreateSuggestionEmail < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestion_emails do |t|
      t.decimal :last_price
      t.decimal :fprice1000
      t.decimal :fprice20000
      t.integer :suggestion
      t.boolean :correct
      t.integer :correct_num
      t.integer :incorrect_num
      t.text :memo
      t.decimal :high_price
      t.decimal :low_price
      t.decimal :buy_price
      t.decimal :sell_price
      t.decimal :open_price
      t.integer :symbol
    end
  end
end
