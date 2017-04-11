class AddSomeColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :enabled_dev_api, :boolean, default: false
  	add_column :users, :api_secret, :string
  	add_column :users, :enabled_two_factor_auth, :boolean, default: false
  	add_column :users, :reserve_tokens, :string
  	add_column :users, :phone, :string, after: :name
  	add_column :users, :enabled_sending_mail, :boolean, default: true
  end
end
