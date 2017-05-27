class SecuritiesController < AuthenticatedController
  
  def index
    @securities = Security.all
  end

end
