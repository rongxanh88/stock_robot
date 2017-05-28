class Admin::IndustriesController < AuthenticatedController

  def new
    @industry = Industry.new
  end
  
end