class HistoricalDate < ApplicationRecord
  # has_many :trading_data
  # has_many :tickers, through: :trading_data
  has_one :trading_data
  has_one :ticker, through: :historical_date

  has_many :cash_flow_statements
  
  validates :date, presence: true
end
