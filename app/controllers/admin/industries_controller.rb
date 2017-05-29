class Admin::IndustriesController < AuthenticatedController
  before_action :set_industry, only: [:edit, :update, :destroy]

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
  end

  def update
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
    flash[:message] = "#{@industry.name} deleted!"
    @industry.destroy

    redirect_to industries_path
  end

  private

  def industry_params
    params.require(:industry).permit(:name)
  end

  def set_industry
    @industry = Industry.find(params[:id])
  end

end