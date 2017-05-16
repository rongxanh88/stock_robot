require 'pry'
require 'csv'
require './lib/quote'
require './app/models/ticker'
require './app/models/security'
require './app/models/historical_date'
require './app/models/trading_data'

class Seed
  attr_accessor :start_time
  attr_reader :RATE_LIMIT

  def initialize
    @RATE_LIMIT = 119
    @start_time = 0
  end

  def self.single_quote_request
    file = "db/csv/complete_stock_ticker.csv"
    quoter = Quote.new

    start_time = Time.now
    counter = 0
    ticker_symbols = [] #["a", "b", "c"].join(",") "a,b,c"

    CSV.foreach file, headers: true, header_converters: :symbol do |row|
      # json = quoter.get_quote(row[:symbol])
      # first_quote = json["quotes"]["quote"]

      sector = Sector.find_or_create_by(name: row[:sector])
      industry = Industry.find_or_create_by(name: row[:industry])
      # security = Security.find_or_create_by(
      #   security_type: first_quote["type"]
      #   )

      ticker = Ticker.create!(symbol: row[:symbol], description: row[:name])
      # ticker.update_attributes(
      #   security_id: security.id, sector_id: sector.id, industry_id: industry.id
      #   )

      counter = check_call_limit(counter)

      #fix nil class problem
      puts "Time: #{Time.now} and counter: #{counter}"
    end
    # 6700 rows of the CSV are added in one minute
  end

  private

  def check_call_limit(counter)
    counter += 1
    current_time = Time.now
    time_left = (start_time + 60) - current_time

    if counter == RATE_LIMIT
      sleep(time_left)
    end

    if time_left <= 0
      counter = 0
      start_time = Time.now
    end
    counter
  end

end

Seed.single_quote_request