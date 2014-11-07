class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  protected

  def authenticate_user!
    unless logged_in?
      return redirect_to root_path, notice: 'Please sign in first.'
    end
  end

  def logged_in?
    current_user.present?
  end
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
