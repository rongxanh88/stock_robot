class TradingData < ApplicationRecord
  belongs_to :ticker
  belongs_to :historical_date

  validates :open, :close, :high,
            :volume, :avg_volume,
            :week_52_high, :week_52_low,
            presence: true
end
