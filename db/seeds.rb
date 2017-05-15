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
    counter = 1
    limit = 5
    CSV.foreach file, headers: true, header_converters: :symbol do |row|
      json = quoter.get_quote(row[:symbol])
      first_quote = json["quotes"]["quote"]

      ticker = Ticker.create!(symbol: row[:symbol], description: row[:name])

      sector = Sector.find_or_create_by(name: row[:sector])
      industry = Industry.find_or_create_by(name: row[:industry])
      security = Security.find_or_create_by(
        security_type: first_quote["type"]
        )
      binding.pry
      ticker = Ticker.create!(
        symbol: row[:symbol], description: row[:name], sector_id: sector.id,
        industry_id: industry.id, security_id: security.id
        )


      counter += 1
      break if counter > limit
    end
    
  end

end

Seed.single_quote_request