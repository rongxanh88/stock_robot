class Sector < ApplicationRecord
  has_many :tickers
  validates :name, presence: true
end
