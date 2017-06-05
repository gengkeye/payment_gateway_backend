class CreateSuggestionEmailResult < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestion_email_results do |t|
      t.integer :time_interval
      t.boolean :correct, default: false
      t.references :suggestion_email, foreign_key: true
      t.integer :unit, default: 0

      t.timestamps null: false
    end
  end
end
