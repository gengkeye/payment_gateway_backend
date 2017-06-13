class AddBaseToSuggestionTables < ActiveRecord::Migration[5.0]
  def change
  	add_column :suggestion_emails, :fbase_source, :integer, default: 0, after: :fbase
  	add_column :suggestion_email_results, :fbase_source, :integer, default: 0, after: :fbase
  end
end
