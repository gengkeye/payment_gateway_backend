class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :toggle_dev_api, :boolean, default: false
  	add_column :users, :updates_email_subscription_level, :string

  	## Confirmable
  	add_column :users, :confirmation_token, :string
  	add_column :users, :confirmed_at, :datetime
  	add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
  	add_column :users, :tos_agreement, :boolean, default: 0


  	## Lockable
  	add_column :users, :failed_attempts, :integer, default: 0
  	add_column :users, :unlock_token, :string
  	add_column :users, :locked_at, :datetime

  	add_index :users, :confirmation_token,   unique: true
  	add_index :users, :unlock_token,         unique: true
  end
end
