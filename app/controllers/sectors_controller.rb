class SectorsController < ApplicationController
  def index
    @sectors = Sector.paginate(:page => params[:page], :per_page => 10)
  end
end
