class RecommendationsController < ApplicationController

  def send_email
    # email = params["email"]
    subject = email_subject["subject"]
    recipient = email_recipient["recipient"]
    Recommendations.deliver_recommend_link_email(recipient, subject)
    return if request.xhr?
    render :text => 'Message sent successfully'
  end

  def index
    render :file => 'app\views\recommendations\email.html.erb'
  end
end
