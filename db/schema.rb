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

ActiveRecord::Schema.define(version: 20170524173840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historical_dates", force: :cascade do |t|
    t.date "date"
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
  end

  add_foreign_key "tickers", "industries"
  add_foreign_key "tickers", "sectors"
  add_foreign_key "tickers", "securities"
  add_foreign_key "trading_data", "historical_dates"
  add_foreign_key "trading_data", "tickers"
end
