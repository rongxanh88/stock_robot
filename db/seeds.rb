require 'csv'
require './lib/quote'
require './lib/finance'
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
        ticker_symbols.clear
      end

      counter += 1

      puts "Row: #{counter}"
    end
    fill_ticker_data(ticker_symbols) if !ticker_symbols.empty?
  end

  private

  def self.fill_ticker_data(ticker_symbols)
    make_json_request(symbols_to_string(ticker_symbols))
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
    make_json_request(symbols_to_string(symbols))
  end

  def self.make_json_request(symbol_param="")
    reporter = Finance.new
    json = reporter.get_report(symbol_param)
    reports = json
    reports.each do |report|
      ticker = Ticker.find_by(symbol: report["request"])
      statement = report["results"].first["tables"]["financial_statements_restate"]["cash_flow_statement"].first
      fill_tables(statement, ticker)
    end
  end

  def self.fill_tables(statement, ticker)
    statement.each do |period, data|
      historical_date = HistoricalDate.find_or_create_by(date: period)
      ticker.cash_flow_statements.create!(
        historical_date_id: historical_date.id,
        beginning_cash_position: data["beginning_cash_position"],
        capital_expenditure: data["capital_expenditure"],
        cash_dividends_paid: data["cash_dividends_paid"],
        change_in_account_payable: data["change_in_account_payable"],
        change_in_inventory: data["change_in_inventory"],
        change_in_other_working_capital: data["change_in_other_working_capital"],
        change_in_payable: data["change_in_payable"],
        change_in_payables_and_accrued_expense: data["change_in_payables_and_accrued_expense"],
        change_in_receivables: data["change_in_receivables"],
        change_in_working_capital: data["beginning_cash_position"],
        change_in_cash: data["change_in_cash"],
        common_stock_issuance: data["common_stock_issuance"],
        common_stock_payments: data["common_stock_payments"],
        deferred_income_tax: data["deferred_income_tax"],
        deferred_tax: data["deferred_tax"],
        depreciation_amortization_depletion: data["depreciation_amortization_depletion"],
        depreciation_and_amortization: data["depreciation_and_amortization"],
        end_cash_position: data["end_cash_position"],
        financing_cash_flow: data["financing_cash_flow"],
        free_cash_flow: data["free_cash_flow"],
        income_tax_paid_supplemental_data: data["income_tax_paid_supplemental_data"],
        interest_paid_supplemental_data: data["interest_paid_supplemental_data"],
        investing_cash_flow: data["investing_cash_flow"],
        issuance_of_capital_stock: data["issuance_of_capital_stock"],
        net_business_purchase_and_sale: data["net_business_purchase_and_sale"],
        net_common_stock_issuance: data["net_common_stock_issuance"],
        net_income: data["net_income"],
        net_income_from_continuing_operations: data["net_income_from_continuing_operations"],
        net_intangibles_purchase_and_sale: data["net_intangibles_purchase_and_sale"],
        net_investment_purchase_and_sale: data["net_investment_purchase_and_sale"],
        net_issuance_payments_of_debt: data["net_issuance_payments_of_debt"],
        net_other_financing_charges: data["net_other_financing_charges"],
        net_other_investing_changes: data["net_other_investing_changes"],
        net_p_p_e_purchase_and_sale: data["net_p_p_e_purchase_and_sale"],
        net_short_term_debt_issuance: data["net_short_term_debt_issuance"],
        other_non_cash_items: data["other_non_cash_items"],
        purchase_of_intangibles: data["purchase_of_intangibles"],
        purchase_of_investment: data["purchase_of_investment"],
        purchase_of_p_p_e: data["purchase_of_p_p_e"],
        repurchase_of_capital_stock: data["repurchase_of_capital_stock"],
        sale_of_investment: data["sale_of_investment"],
        stock_based_compensation: data["stock_based_compensation"]
      )
    end
  end

end

# SeedBasic.quote_request
SeedFinancialData.quote_request