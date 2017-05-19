class Gateway < ApplicationRecord
	include Uid
	
	attr_accessor :exchange_rate_adapter_name_1, :exchange_rate_adapter_name_2, :exchange_rate_adapter_name_3
	belongs_to :user
	has_many :orders
	validates_presence_of :name, :confirmations_required, :pubkey, :secret, :check_signature
    validates_inclusion_of :test_mode, :active, :allow_links, :donation_mode, :receive_payments_notifications, in: [true, false]
    before_create :set_secret

	enum default_currency: {
		CNY: 1,
		PHP: 2,
		USD: 3
	}
	enum country: {
		China: 1,
		America: 2,
		Philippine: 3
	}
	enum convert_currency_to:{
		BTC: 1,
		mBTC: 2, # 0.001 BTC
		uBTC: 3 # 0.001 mBTC
	}
	EXCHANGE_RATE_ADAPTER = %w(Huobi Okcoin Btcchina)
end