class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :toggle_dev_api, :boolean, default: false
  	add_column :users, :updates_email_subscription_level, :string
  end
end
