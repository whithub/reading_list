class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end

  def require_authentication
    unless logged_in?
      flash[:error] = 'You must be logged in to perform this action.'
      redirect_to welcome_path
      return false
    end
  end
end
