class SuggestionEmail < ApplicationRecord
	has_many :results, class_name: 'SuggestionEmailResult'

	enum symbol: {
		ltccny: 0,
		btccny: 1,
		ethcny: 2
	}

	enum suggestion: {
		buy: 0,
		sell: 1,
		keep: 2
	}
end