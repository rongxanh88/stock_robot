class Ticker < ApplicationRecord
  has_one :sector
  has_one :industry
  has_one :security
  has_many :trading_data
  has_many :historical_dates, through: :trading_data

  validates :symbol, :description, presence: true
end