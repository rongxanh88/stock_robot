class Ticker < ApplicationRecord
  has_one :trading_data
  has_one :historical_date, through: :trading_data

  has_many :ticker_tags
  has_many :tags, through: :ticker_tags

  validates :symbol, :description, presence: true
end