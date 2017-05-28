class Admin::IndustriesController < AuthenticatedController

  def new
    @industry = Industry.new
  end
  
  def create
    @industry = Industry.new(industry_params)
    
    if @industry.save
      flash[:message] = "#{@industry.name} created!"
      redirect_to industries_path
    else
      flash[:message] = "Unable to create industry"
      render :new
    end
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def update
    @industry = Industry.find(params[:id])
    @industry.update_attributes(industry_params)

    if @industry.save
      flash[:message] = "#{@industry.name} updated!"
      redirect_to industries_path
    else
      flash[:message] = "Unable to update industry"
      render :edit
    end
  end

  def destroy
    @industry = Industry.find(params[:id])
    flash[:message] = "#{@industry.name} deleted!"
    @industry.destroy

    redirect_to industries_path
  end

  private

  def industry_params
    params.require(:industry).permit(:name)
  end
end