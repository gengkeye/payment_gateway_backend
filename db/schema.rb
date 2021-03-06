# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170609024010) do

  create_table "direction_data_diffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.float    "amount_diff",      limit: 24
    t.float    "total_value_diff", limit: 24
    t.integer  "diff_base"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.float    "amount_sell",      limit: 24
    t.float    "amount_buy",       limit: 24
  end

  create_table "gateways", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "confirmations_required",                       default: 0,       null: false
    t.integer  "last_keychain_id",                             default: 0,       null: false
    t.string   "pubkey"
    t.string   "order_class",                                                    null: false
    t.string   "secret",                                                         null: false
    t.string   "name",                                                           null: false
    t.string   "default_currency",                             default: "BTC"
    t.text     "callback_url",                   limit: 65535
    t.boolean  "check_signature",                              default: false,   null: false
    t.string   "exchange_rate_adapter_names"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at"
    t.integer  "orders_expiration_period"
    t.boolean  "check_order_status_in_db_first"
    t.boolean  "active",                                       default: true
    t.string   "order_counters"
    t.string   "hashed_id"
    t.string   "address_provider",                             default: "Bip32", null: false
    t.string   "address_derivation_scheme"
    t.boolean  "test_mode",                                    default: false
    t.integer  "test_last_keychain_id",                        default: 0,       null: false
    t.string   "test_pubkey"
    t.text     "after_payment_redirect_to",      limit: 65535
    t.boolean  "auto_redirect",                                default: false
    t.text     "merchant_url",                   limit: 65535
    t.boolean  "allow_links",                                  default: false
    t.text     "back_url",                       limit: 65535
    t.text     "custom_css_url",                 limit: 65535
    t.boolean  "donation_mode",                                default: false
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.text     "description",                    limit: 65535
    t.string   "convert_currency_to",                          default: "BTC"
    t.boolean  "receive_payments_notifications",               default: false
    t.index ["hashed_id"], name: "gateways_hashed_id_index", using: :btree
    t.index ["id"], name: "gateways_id_index", unique: true, using: :btree
    t.index ["pubkey"], name: "gateways_pubkey_index", unique: true, using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "address",                                                                          null: false
    t.string   "tid"
    t.integer  "status",                                                           default: 0,     null: false
    t.integer  "keychain_id",                                                                      null: false
    t.decimal  "amount",                                  precision: 10, scale: 2,                 null: false
    t.integer  "gateway_id",                                                                       null: false
    t.string   "data"
    t.text     "callback_response",         limit: 65535
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at"
    t.string   "payment_id"
    t.string   "description"
    t.integer  "reused",                                                           default: 0
    t.string   "callback_data"
    t.decimal  "amount_paid",                             precision: 10, scale: 2
    t.text     "callback_url",              limit: 65535
    t.string   "title"
    t.boolean  "test_mode",                                                        default: false
    t.text     "after_payment_redirect_to", limit: 65535
    t.boolean  "auto_redirect",                                                    default: false
    t.integer  "block_height_created_at"
    t.string   "amount_with_currency"
    t.string   "customer_uid"
    t.index ["address"], name: "orders_address_index", using: :btree
    t.index ["id"], name: "orders_id_index", unique: true, using: :btree
    t.index ["keychain_id", "gateway_id"], name: "orders_keychain_id_gateway_id_index", using: :btree
    t.index ["payment_id"], name: "orders_payment_id_index", unique: true, using: :btree
  end

  create_table "schema_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "suggestion_email_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "time_interval"
    t.boolean  "correct",                                      default: false
    t.integer  "suggestion_email_id"
    t.integer  "unit",                                         default: 0
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.decimal  "before_price",        precision: 10, scale: 2
    t.decimal  "now_price",           precision: 10, scale: 2
    t.decimal  "gap",                 precision: 10, scale: 2
    t.integer  "fbase"
    t.integer  "fbase_source",                                 default: 0
    t.index ["suggestion_email_id"], name: "index_suggestion_email_results_on_suggestion_email_id", using: :btree
  end

  create_table "suggestion_emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "last_price",                 precision: 10, scale: 2
    t.integer  "suggestion"
    t.text     "memo",         limit: 65535
    t.decimal  "high_price",                 precision: 10, scale: 2
    t.decimal  "low_price",                  precision: 10, scale: 2
    t.decimal  "buy_price",                  precision: 10, scale: 2
    t.decimal  "sell_price",                 precision: 10, scale: 2
    t.decimal  "open_price",                 precision: 10, scale: 2
    t.integer  "symbol"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "fbase"
    t.integer  "fbase_source",                                        default: 0
    t.decimal  "fprice",                     precision: 10, scale: 2
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "order_id"
    t.string   "tid",           null: false
    t.bigint   "amount",        null: false
    t.integer  "confirmations"
    t.integer  "block_height"
    t.datetime "created_at",    null: false
    t.datetime "updated_at"
    t.index ["id"], name: "transactions_id_index", unique: true, using: :btree
    t.index ["order_id"], name: "transactions_order_id_index", using: :btree
    t.index ["tid"], name: "transactions_tid_index", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "app_id"
    t.string   "email",                                                     default: "",    null: false
    t.string   "encrypted_password",                                        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.string   "name",                                                      default: ""
    t.string   "phone"
    t.decimal  "balance_of_btc",                   precision: 10, scale: 2, default: "0.0"
    t.boolean  "enabled_dev_api",                                           default: false
    t.string   "api_secret"
    t.boolean  "enabled_two_factor_auth",                                   default: false
    t.string   "reserve_tokens"
    t.boolean  "enabled_sending_mail",                                      default: true
    t.integer  "role",                                                      default: 1
    t.boolean  "toggle_dev_api",                                            default: false
    t.integer  "updates_email_subscription_level"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "tos_agreement",                                             default: false
    t.integer  "failed_attempts",                                           default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "withdrawals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "gateway_id"
    t.integer  "customer_uid"
    t.integer  "auditor_id"
    t.decimal  "amount",                           precision: 10, scale: 2
    t.integer  "status"
    t.boolean  "approval"
    t.text     "disapproval_reason", limit: 65535
    t.datetime "approval_time"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_foreign_key "suggestion_email_results", "suggestion_emails"
  add_foreign_key "transactions", "orders", name: "transactions_ibfk_1", on_update: :cascade, on_delete: :cascade
end
