class Industry::TickersController < AuthenticatedController
  def index
    @industry = Industry.find(params[:industry_id])
    @tickers = @industry.tickers.paginate(:page => params[:page], :per_page => 10)
    render :template => "tickers/index"
  end

  def show
    binding.pry
    @ticker = Ticker.find(params[:id])
    @trading_data = TradingData.find_by(ticker_id: @ticker.id)
  end
end