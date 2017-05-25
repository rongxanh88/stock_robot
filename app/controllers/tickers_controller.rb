class TickersController < AuthenticatedController
  def index
    @tickers = Ticker.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @ticker = Ticker.find(params[:id])
    @trading_data = TradingData.find_by(ticker_id: @ticker.id)
  end
end