class LeadMailer < ActionMailer::Base
  default from: "office@example.com"

  def signup_notification(lead_signup_id)
    mail(:to => "office@example.com", :subject => "New signup")
  end
end
