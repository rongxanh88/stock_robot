class HistoricalDate < ApplicationRecord
  has_many :trading_data
  
  validates :date, presence: true
end
