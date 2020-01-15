class SessionsController < ApplicationController
  def new
  end

def create
 admin = Admin.find_by(email: params[:email])
 if admin && admin.authenticate(params[:password])
  session[:admin_id] = admin.id
  flash[:success] = "Successfully Logged In!"
  redirect_to '/contact'
 else
  flash[:warning] = "Invalid Username or Password"
  raise ActionController::RoutingError.new('Not Found')
 end
end

 def destroy
  session[:admin_id] = nil
  flash[:success] = "Successfully Logged Out!"
  raise ActionController::RoutingError.new('Not Found')
 end
end
