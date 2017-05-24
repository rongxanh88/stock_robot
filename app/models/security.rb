class Security < ApplicationRecord
  has_many :tickers
  validates :security_type, presence: true, uniqueness: true
end
