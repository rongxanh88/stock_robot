class Admin::SectorsController < AuthenticatedController
  before_action :set_sector, only: [:edit, :update, :destroy]

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
  end

  def update
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
    flash[:message] = "Sector deleted!"
    @sector.destroy
    redirect_to sectors_path
  end

  private

  def sector_params
    params.require(:sector).permit(:name)
  end

  def set_sector
    @sector = Sector.find(params[:id])
  end
end