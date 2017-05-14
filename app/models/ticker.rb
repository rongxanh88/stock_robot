class Ticker < ApplicationRecord
  has_one :security
  has_one :sector
  has_one :industry
  has_many :trading_data

  validates :symbol, :text, presence: true
end
