module SecuritiesHelper
  def current_admin?
    current_user && current_user.admin?
  end
end
