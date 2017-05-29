require 'csv'
require './lib/quote'
require './app/models/ticker'
require './app/models/security'
require './app/models/historical_date'
require './app/models/trading_data'

class SeedBasic

  def self.quote_request
    file = "db/csv/complete_stock_ticker.csv"

    counter = 0
    ticker_symbols = []

    CSV.foreach file, headers: true, header_converters: :symbol do |row|
      if row[:symbol].include? "^"
        next
      end

      sector = Sector.find_or_create_by(name: row[:sector])
      industry = Industry.find_or_create_by(name: row[:industry])
      ticker = Ticker.find_or_create_by(symbol: row[:symbol].strip, description: row[:name])

      ticker.update_attributes(
        sector_id: sector.id, industry_id: industry.id
        )
      ticker_symbols.push(row[:symbol])

      if ticker_symbols.size >= 50
        fill_ticker_data(ticker_symbols)
      end

      counter += 1

      puts "Row: #{counter}"
    end
    fill_ticker_data(ticker_symbols) if !ticker_symbols.empty?
  end

  private

  def self.fill_ticker_data(ticker_symbols)
    securities = symbols_to_string(ticker_symbols)
    ticker_symbols.clear
    make_json_request(securities)
  end

  def self.make_json_request(ticker_symbols="")
    quoter = Quote.new
    json = quoter.get_report(ticker_symbols)
    quotes = json["quotes"]["quote"]
    quotes.each do |quote|
      fill_tables(quote)
    end
  end

  def self.symbols_to_string(symbols=[])
    symbols.join(",")
  end

  def self.fill_tables(quote)
    security = Security.find_or_create_by(
        security_type: quote["type"]
        )
    ticker = Ticker.find_by(symbol: quote["symbol"])
    ticker.update_attributes(security_id: security.id)
    date = HistoricalDate.find_or_create_by(date: "most recent trading day")
    TradingData.create!(
      ticker_id: ticker.id, historical_date_id: date.id, open: quote["open"],
      high: quote["high"], close: quote["close"], volume: quote["volume"],
      avg_volume: quote["average_volume"], week_52_high: quote["week_52_high"],
      week_52_low: quote["week_52_low"]
      )
  end

end

class SeedFinancialData

  def self.quote_request
    symbols = []
    Ticker.find_each(batch_size: 50) do |ticker|
      symbols << ticker.symbol
      binding.pry
      if symbols.count >= 50
        fill_financial_data(symbols)
        symbols.clear
      end
    end
  end

  private

  def self.symbols_to_string(symbols=[])
    symbols.join(",")
  end

  def self.fill_financial_data(symbols)
    symbol_string = symbols_to_string(symbols)
    make_json_request(symbol_string)
  end

  def make_json_request(symbol_param="")
    reporter = Finance.new
    json = reporter.get_report(ticker_symbols)
    reports = json
    reports.each do |report|
      binding.pry
      statement = report["results"].first["tables"]["financial_statements_restate"]["cash_flow_statement"].first
      fill_tables(statement)
    end
  end

  def fill_tables(statement)
    binding.pry
  end

end

# SeedBasic.quote_request
SeedFinancialData.quote_request

# report.first["results"].first["tables"]["financial_statements_restate"]["cash_flow_statement"].first