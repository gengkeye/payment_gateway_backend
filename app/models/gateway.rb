class Gateway < ApplicationRecord
	include Uid
	include HashedId
	
	attr_accessor :exchange_rate_adapter_name_1, :exchange_rate_adapter_name_2, :exchange_rate_adapter_name_3

	belongs_to :user
	has_many :orders
	validates_presence_of :name, :confirmations_required, :pubkey, :secret, :orders_expiration_period, :default_currency, :convert_currency_to
    validates_inclusion_of :test_mode, :active, :allow_links, :donation_mode, :receive_payments_notifications, :check_signature, in: [true, false]

	BTC_UNITS = %w( BTC mBTC uBTC)
	SUPPORT_CURRENCIES = %w(CNY PHP USD)
	EXCHANGE_RATE_ADAPTER = %w(Huobi Okcoin Btcchina)
	SUPPORT_COUNTRIES = %w(China America Philippines)
end