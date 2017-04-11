class Order < ApplicationRecord
	belongs_to :gateway
	enum status: {
		unconfirmed: 1,
		paid: 2,
		underpaid: 3, # not enough money received
		overpaid: 4, # too much has been received
		expired: 5, 
		canceled: 6
	}
end