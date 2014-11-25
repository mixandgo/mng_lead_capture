require "rails_helper"

RSpec.describe LeadMailer, :type => :mailer do
  describe "#signup_notification" do
    let(:lead_signup) { create(:lead_signup) }

    before :each do
      @email = LeadMailer.signup_notification(lead_signup.id)
    end

    it "sends a notification email to office@example.com" do
      @email.should deliver_to("office@example.com")
    end

    it "sends a notification email from office@example.com" do
      @email.should deliver_from("office@example.com")
    end

    it "sets the subject to 'New signup'" do
      @email.should have_subject(/New signup/)
    end

    it "sends the signup's name and email" do
      expect(@email.body).to have_content(lead_signup.name)
      expect(@email.body).to have_content(lead_signup.email)
    end
  end
end
