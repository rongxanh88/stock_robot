class Tag::TickersController < AuthenticatedController
  def index
    @tag = Tag.find(params[:tag_id])
    @tickers = @tag.tickers.paginate(:page => params[:page], :per_page => 10)
    render :template => "tickers/index"
  end
end