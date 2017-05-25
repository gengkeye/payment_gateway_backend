class AddAppIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :app_id, :string, after: :id
    remove_column :users, :uid, :string
  end
end
