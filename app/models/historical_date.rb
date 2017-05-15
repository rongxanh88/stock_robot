class HistoricalDate < ApplicationRecord
  has_many :trading_data
  has_many :tickers, through: :trading_data
  
  validates :date, presence: true
end
