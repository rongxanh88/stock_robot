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
      first_quote = json["quotes"]["quote"]

      sector = Sector.find_or_create_by(name: row[:sector])
      industry = Industry.find_or_create_by(name: row[:industry])
      security = Security.find_or_create_by(
        security_type: first_quote["type"]
        )

      ticker = Ticker.create!(symbol: row[:symbol], description: row[:name])
      ticker.update_attributes(
        security_id: security.id, sector_id: sector.id, industry_id: industry.id
        )
    end
    
  end

end

Seed.single_quote_request