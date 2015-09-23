class LinksController < ApplicationController
  before_filter :require_authentication
  before_action :set_user

  def index
    @links = Link.all
    @link = Link.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path #, notice: "Ticket Created"
    else
      redirect_to root_path, notice: "URL not valid" #@link.errors.full_messages.join(", ")
    end
  end

  def read
    set_link
    @link.read!
    redirect_to root_url #, notice: "Ticket '#{@ticket.name}' is back in Current Sprint."
  end

  def unread
    set_link
    @link.unread!
    redirect_to root_url #, notice: "Ticket '#{@ticket.name}' is back in Current Sprint."
  end


  private

  def link_params
    params.require(:link).permit(:url, :status)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_link
    @link = Link.find(params[:id])
  end

end
