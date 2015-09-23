class UsersController < ApplicationController
  before_filter :require_authentication, except: [:new, :create]
  before_action :set_user, except: [:new, :create]

  def index
    render :index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Welcome, #{@user.name}!"
    else
      flash[:error] = 'Name, Email or Password cannot be blank. Please fill in all fields.'  #'Username has already been taken.'
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
