class NewsletterMailer < ActionMailer::Base
  default from: "office@mixandgo.com"

  def signup_notification(newsletter_signup_id)
    mail(:to => "office@mixandgo.com", :subject => "New signup")
  end
end
