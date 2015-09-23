class RecommendationMailer < ApplicationMailer
  default from: "reading-list@example.com"

  def sample_email(recipient_email)
    mail(to: recipient_email, subject: 'Recommendation Email')
  end

end
