class Ticker < ApplicationRecord
  has_many :trading_data
  has_many :historical_dates, through: :trading_data

  validates :symbol, :description, presence: true
end
