class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_admin
     @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  helper_method :current_admin

  def authenticate_admin!
  raise ActionController::RoutingError.new('Not Found') unless current_admin
  end
end
