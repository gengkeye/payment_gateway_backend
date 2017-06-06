class ChangeSomeColumnsToSuggestionEmail < ActiveRecord::Migration[5.0]
  def change
  	remove_column :suggestion_emails, :fprice1000, :decimal
  	remove_column :suggestion_emails, :fprice20000, :decimal
  	remove_column :suggestion_emails, :correct_num, :decimal
  	remove_column :suggestion_emails, :incorrect_num, :decimal
  	remove_column :suggestion_emails, :correct, :boolean
  	add_column    :suggestion_emails, :fbase, :integer
  	add_column    :suggestion_emails, :fprice, :decimal
  end
end
