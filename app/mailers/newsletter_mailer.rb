class NewsletterMailer < ActionMailer::Base
  default from: "office@example.com"

  def signup_notification(newsletter_signup_id)
    mail(:to => "office@example.com", :subject => "New signup")
  end
end
