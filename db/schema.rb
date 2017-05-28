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

ActiveRecord::Schema.define(version: 20170528222613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_flow_statements", force: :cascade do |t|
    t.decimal "beginning_cash_position"
    t.decimal "capital_expenditure"
    t.decimal "cash_dividends_paid"
    t.decimal "change_in_account_payable"
    t.decimal "change_in_inventory"
    t.decimal "change_in_other_working_capital"
    t.decimal "change_in_payable"
    t.decimal "change_in_payables_and_accrued_expense"
    t.decimal "change_in_receivables"
    t.decimal "change_in_working_capital"
    t.decimal "change_in_cash"
    t.decimal "common_stock_issuance"
    t.decimal "common_stock_payments"
    t.decimal "deferred_income_tax"
    t.decimal "deferred_tax"
    t.decimal "depreciation_amortization_depletion"
    t.decimal "depreciation_and_amortization"
    t.decimal "end_cash_position"
    t.decimal "financing_cash_flow"
    t.decimal "free_cash_flow"
    t.decimal "income_tax_paid_supplemental_data"
    t.decimal "interest_paid_supplemental_data"
    t.decimal "investing_cash_flow"
    t.decimal "issuance_of_capital_stock"
    t.decimal "net_business_purchase_and_sale"
    t.decimal "net_common_stock_issuance"
    t.decimal "net_income"
    t.decimal "net_income_from_continuing_operations"
    t.decimal "net_intangibles_purchase_and_sale"
    t.decimal "net_investment_purchase_and_sale"
    t.decimal "net_issuance_payments_of_debt"
    t.decimal "net_other_financing_charges"
    t.decimal "net_other_investing_changes"
    t.decimal "net_p_p_e_purchase_and_sale"
    t.decimal "net_short_term_debt_issuance"
    t.decimal "operating_cash_flow"
    t.decimal "other_non_cash_items"
    t.decimal "purchase_of_intangibles"
    t.decimal "purchase_of_investment"
    t.decimal "purchase_of_p_p_e"
    t.decimal "repurchase_of_capital_stock"
    t.decimal "sale_of_investment"
    t.decimal "stock_based_compensation"
    t.bigint "ticker_id"
    t.bigint "historical_date_id"
    t.index ["historical_date_id"], name: "index_cash_flow_statements_on_historical_date_id"
    t.index ["ticker_id"], name: "index_cash_flow_statements_on_ticker_id"
  end

  create_table "historical_dates", force: :cascade do |t|
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "securities", force: :cascade do |t|
    t.text "security_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticker_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "ticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_ticker_tags_on_tag_id"
    t.index ["ticker_id"], name: "index_ticker_tags_on_ticker_id"
  end

  create_table "tickers", force: :cascade do |t|
    t.text "symbol"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "security_id"
    t.bigint "sector_id"
    t.bigint "industry_id"
    t.index ["industry_id"], name: "index_tickers_on_industry_id"
    t.index ["sector_id"], name: "index_tickers_on_sector_id"
    t.index ["security_id"], name: "index_tickers_on_security_id"
  end

  create_table "trading_data", force: :cascade do |t|
    t.bigint "ticker_id"
    t.bigint "historical_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "open"
    t.float "high"
    t.float "close"
    t.bigint "volume"
    t.bigint "avg_volume"
    t.float "week_52_high"
    t.float "week_52_low"
    t.index ["historical_date_id"], name: "index_trading_data_on_historical_date_id"
    t.index ["ticker_id"], name: "index_trading_data_on_ticker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "cash_flow_statements", "historical_dates"
  add_foreign_key "cash_flow_statements", "tickers"
  add_foreign_key "ticker_tags", "tags"
  add_foreign_key "ticker_tags", "tickers"
  add_foreign_key "tickers", "industries"
  add_foreign_key "tickers", "sectors"
  add_foreign_key "tickers", "securities"
  add_foreign_key "trading_data", "historical_dates"
  add_foreign_key "trading_data", "tickers"
end
