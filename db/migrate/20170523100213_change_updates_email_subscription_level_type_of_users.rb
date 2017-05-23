class ChangeUpdatesEmailSubscriptionLevelTypeOfUsers < ActiveRecord::Migration[5.0]
	def change
		change_table :users do |t|
			t.change :updates_email_subscription_level, :integer
		end
	end
end
