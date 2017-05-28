class TickerTag < ApplicationRecord
  belongs_to :tag 
  belongs_to :ticker
end
