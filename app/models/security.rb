class Security < ApplicationRecord
  belongs_to :tickers
  validates :security_type, presence: true
end
