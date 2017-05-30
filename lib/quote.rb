require './lib/tradier_api'

class Quote < TradierAPI
  ENDPOINT = "https://api.tradier.com/v1/markets/quotes?"

  def initialize
    super(ENDPOINT)
  end
end