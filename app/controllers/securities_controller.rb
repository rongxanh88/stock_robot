class SecuritiesController < AuthenticatedController
  def index
    @securities = Security.all
  end

  def new
    require_admin
    @security = Security.new
  end

  def create
    @security = Security.new(security_params)

    if @security.save
      flash[:message] = "Security Type Created!"
      redirect_to securities_path
    else
      flash[:message] = "Security type creation not successful!"
      render :new
    end
  end

  private

  def security_params
    params.require(:security).permit(:security_type)
  end
end
