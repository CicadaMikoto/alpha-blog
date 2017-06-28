class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? # available to views

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] # if exists or not
  end

  def logged_in?
      !!current_user # boolean conversion
  end

  def require_user
      if !logged_in?
          flash[:danger] = "You must not sneak"
          redirect_to root_path
      end
  end
end
