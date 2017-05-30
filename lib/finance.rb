require './lib/tradier_api'

class Finance < TradierAPI
  ENDPOINT = "https://api.tradier.com/beta/markets/fundamentals/financials?"

  def initialize
    super(ENDPOINT)
  end
end