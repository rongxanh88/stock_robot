class Sector::TickersController < AuthenticatedController
  def index
    @sector = Sector.find(params[:sector_id])
    @tickers = @sector.tickers.paginate(:page => params[:page], :per_page => 10)
    render :template => "tickers/index"
  end
end