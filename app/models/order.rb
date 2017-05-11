require 'csv'

class Order < ApplicationRecord
	belongs_to :gateway
	enum status: {
		unconfirmed: 1,
		paid: 2,
		underpaid: 3, # not enough money received
		overpaid: 4, # too much has been received
		expired: 5, 
		canceled: 6,
		partially_paid: -3
	}

	def self.to_csv
	  attributes = Order.column_names

	  CSV.generate(headers: true) do |csv|
	    csv << attributes

	    all.each do |user|
	      csv << attributes.map{ |attr| user.send(attr) }
	    end
	  end
	end
end