class ChangeDecimalScales < ActiveRecord::Migration[5.0]
  def change
  	change_column :suggestion_emails, :last_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_emails, :high_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_emails, :low_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_emails, :open_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_emails, :buy_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_emails, :sell_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_emails, :fprice, :decimal, precision: 10, scale: 2

  	change_column :suggestion_email_results, :before_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_email_results, :now_price, :decimal, precision: 10, scale: 2
  	change_column :suggestion_email_results, :gap, :decimal, precision: 10, scale: 2

  	change_column :withdrawals, :amount, :decimal, precision: 10, scale: 2

  	change_column :users, :balance_of_btc, :decimal, precision: 10, scale: 2

  	change_column :orders, :amount, :decimal, precision: 10, scale: 2
  	change_column :orders, :amount_paid, :decimal, precision: 10, scale: 2
  end
end
