class Admin::SecuritiesController < AuthenticatedController
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
    @security = Security.find(params[:id])
  end

  def update
    @security = Security.find(params[:id])
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
    @security = Security.find(params[:id])
    @security.destroy
    flash[:message] = "Security Type Deleted!"

    redirect_to securities_path
  end
  
  private

  def security_params
    params.require(:security).permit(:security_type)
  end
end