class Admin::SectorsController < AuthenticatedController

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(sector_params)
    if @sector.save
      flash[:message] = "New sector: #{@sector.name} created!"
      redirect_to sectors_path
    else
      flash[:message] = "Sector creation unsuccessful!"
      render :new
    end
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def update
    @sector = Sector.find(params[:id])
    @sector.update_attributes(sector_params)

    if @sector.save
      flash[:message] = "Sector: #{@sector.name} updated!"
      redirect_to sectors_path
    else
      flash[:message] = "Unable to update sector"
      render :edit
    end

  end

  def destroy
    @sector = Sector.find(params[:id])
    flash[:message] = "Sector deleted!"
    @sector.destroy
    redirect_to sectors_path
  end

  private

  def sector_params
    params.require(:sector).permit(:name)
  end
end