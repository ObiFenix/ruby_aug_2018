class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :require_login
  def current_manager
    Manager.find(session[:manager_id]) if session[:manager_id]
  end

  helper_method :current_manager
end
