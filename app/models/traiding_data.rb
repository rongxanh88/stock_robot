class TraidingData < ApplicationRecord
  belongs_to :ticker
  belongs_to :historical_date
end
