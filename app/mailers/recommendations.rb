class Recommendations < ApplicationMailer
  default from: "reading-list@example.com"

  # def recommend_link_email(email_address)
  #   mail(to: email_address, subject: 'Recommended Read')
  # end

  def recommend_link_email(recipient, subject)
    @subject = subject
    @recipient = recipient
  end

end
