class TickersController < AuthenticatedController
  def index
    @tickers = Ticker.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @ticker = Ticker.find(params[:id])
    @trading_data = TradingData.find_by(ticker_id: @ticker.id)
  end

  def update
    @ticker = Ticker.find(params[:id])
    @ticker.update_attributes(tag_params)
    @ticker.save
    
    redirect_to ticker_path(@ticker)
  end

  def search
    ticker = Ticker.find_by(symbol: params[:symbol])

    if ticker
      redirect_to ticker_path(ticker)
    else
      flash[:message] = "Stock symbol not found."
      redirect_to tickers_path
    end
  end

  private

  def tag_params
    params.require(:ticker).permit(:tag_list)
  end
end