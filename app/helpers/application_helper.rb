module ApplicationHelper
  def log_off_link
    if session[:user_id]
      link_to 'Log Out', login_path, method: 'delete'
    end
  end
end
