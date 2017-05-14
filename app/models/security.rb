class Security < ApplicationRecord
  belongs_to :tickers
  
  validates :name, presence: true
end
