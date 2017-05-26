class SecuritiesController < AuthenticatedController
  def index
    @securities = Security.all
  end

  def new
    require_admin
    binding.pry
    @security = Security.new
  end
end
