class CreateWithdrawal < ActiveRecord::Migration[5.0]
  def change
    create_table :withdrawals do |t|
      t.integer :user_id
      t.integer :gateway_id
      t.integer :customer_uid
      t.integer :auditor_id
      t.decimal :amount
      t.integer :status
      t.boolean :approval
      t.text :disapproval_reason
      t.datetime :approval_time

      t.timestamps null: false
    end
  end
end
