class Tag < ApplicationRecord
  has_many :ticker_tags
  has_many :tickers, through: :ticker_tags

  validates :title, presence: true, uniqueness: true
end
