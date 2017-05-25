class IndustriesController < AuthenticatedController
  def index
    @industries = Industry.paginate(:page => params[:page], :per_page => 10)
  end
end
