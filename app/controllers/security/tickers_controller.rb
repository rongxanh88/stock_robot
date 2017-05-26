class Security::TickersController < AuthenticatedController
  def index
    @security = Security.find(params[:security_id])
    @tickers = @security.tickers.paginate(:page => params[:page], :per_page => 10)
    render :template => "tickers/index"
  end
end