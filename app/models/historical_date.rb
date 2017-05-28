class HistoricalDate < ApplicationRecord
  # has_many :trading_data
  # has_many :tickers, through: :trading_data
  has_one :trading_data
  has_one :ticker, through: :historical_date
  
  validates :date, presence: true
end
