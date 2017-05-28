module IndustriesHelper
  def current_admin?
    current_user && current_user.admin?
  end
end
