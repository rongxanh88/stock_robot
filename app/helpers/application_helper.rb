module ApplicationHelper
  def log_off_link
    if session[:user_id]
      link_to 'Log Off', login_path, method: 'delete'
    end
  end
end
