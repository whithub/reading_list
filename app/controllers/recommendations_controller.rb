class RecommendationsController < ApplicationController

  def new
    @user = current_user
    @link = Link.find(params[:link_id])
  end

  def create
    RecommendationMailer.sample_email(recommendation_params[:send_to_email]).deliver_now
    flash[:notice] = 'Email sent'
    redirect_to root_path
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:send_to_email)
  end

end
