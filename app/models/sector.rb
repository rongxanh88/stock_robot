class Sector < ApplicationRecord
  # belongs_to :tickers
  validates :name, presence: true
end
