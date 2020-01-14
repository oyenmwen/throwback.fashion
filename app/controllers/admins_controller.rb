class AdminsController < ApplicationController

def create
  if current_admin
    admin = Admin.new(
      name:params[:name],
      email:params[:email],
      password:params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if admin.save
      session[:admin_id] = admin.id
      flash[:success] = "Successfully created an Admin!"
      redirect_to '/contact'
    else
      flash[:warning] = "Invalid Email or Password"
      redirect_to '/signup'
    end
    
  else
    flash[:warning] = "You must be logged in to see this page"
    redirect_to '/login'
  end

end

end
