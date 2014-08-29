class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :auth_token
  
  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  
  def current_user
    user = User.find_by_session_token(session[:session_token])
    user ? user : nil
  end
  
  def log_out!(user)
    user.reset_session_token!
    session[:session_token] = SecureRandom.urlsafe_base64(16)
  end
  
  def auth_token
    (
      "<input type='hidden' 
      name='authenticity_token' 
      value='<%= form_authenticity_token %>'>"
    ).html_safe
  end
  
end
