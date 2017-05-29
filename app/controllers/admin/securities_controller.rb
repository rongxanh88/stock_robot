class Admin::SecuritiesController < AuthenticatedController
  before_action :set_security, only: [:edit, :update, :destroy]

  def new
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

  def edit
  end

  def update
    @security.update_attributes(security_params)
    
    if @security.save
      flash[:message] = "Security Type Updated!"
      redirect_to securities_path
    else
      flash[:message] = "Unable to make changes"
      render :edit
    end
  end

  def destroy
    @security.destroy
    flash[:message] = "Security Type Deleted!"

    redirect_to securities_path
  end
  
  private

  def security_params
    params.require(:security).permit(:security_type)
  end

  def set_security
    @security = Security.find(params[:id])
  end
end