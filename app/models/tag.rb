class Tag < ApplicationRecord
  has_many :ticker_tags, dependent: :destroy
  has_many :tickers, through: :ticker_tags

  validates :title, presence: true, uniqueness: true
end
