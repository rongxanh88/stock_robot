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

  private

  def sector_params
    params.require(:sector).permit(:name)
  end
end