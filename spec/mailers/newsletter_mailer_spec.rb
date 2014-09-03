require "rails_helper"

RSpec.describe NewsletterMailer, :type => :mailer do
  describe "#signup_notification" do
    let(:newsletter_signup) { create(:newsletter_signup) }

    before :each do
      @email = NewsletterMailer.signup_notification(newsletter_signup.id)
    end
    
    it "sends a notification email to office@mixandgo.com" do
      @email.should deliver_to("office@mixandgo.com")
    end

    it "sends a notification email from office@mixandgo.com" do
      @email.should deliver_from("office@mixandgo.com")
    end

    it "sets the subject to 'New signup'" do
      @email.should have_subject(/New signup/)
    end
  end
end