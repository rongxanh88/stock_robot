require 'pry'
require 'csv'
require './lib/quote'
require './app/models/ticker'
require './app/models/security'
require './app/models/historical_date'
require './app/models/trading_data'

class Seed

  def self.single_quote_request
    file = "db/csv/complete_stock_ticker.csv"
    quoter = Quote.new
    CSV.foreach file, headers: true, header_converters: :symbol do |row|
      json = quoter.get_quote(row[:symbol])
      binding.pry
    end
    
  end

end

Seed.single_quote_request