class AddSomeColumnsToSuggestionEmailResults < ActiveRecord::Migration[5.0]
  def change
    add_column :suggestion_email_results, :before_price, :decimal
    add_column :suggestion_email_results, :now_price, :decimal
    add_column :suggestion_email_results, :gap, :decimal
    add_column :suggestion_email_results, :fbase, :integer
  end
end
