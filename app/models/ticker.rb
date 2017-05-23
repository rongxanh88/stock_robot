class Ticker < ApplicationRecord
  # belongs_to :sector
  # belongs_to :industry
  # belongs_to :security
  has_many :trading_data
  has_many :historical_dates, through: :trading_data

  validates :symbol, :description, presence: true
end