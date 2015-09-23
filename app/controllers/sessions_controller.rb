class SessionsController < ApplicationController

  def new
  end


  def create
    if user = User.find_by(email: params[:session][:email])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Welcome, #{user.name}!"
    else
      flash[:alert] = "Email and/or Password were invalid."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    @current_user = nil
    flash[:alert] = "Logged out."
    redirect_to welcome_path
  end
end
