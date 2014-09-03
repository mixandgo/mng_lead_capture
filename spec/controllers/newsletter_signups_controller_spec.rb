require 'rails_helper'

RSpec.describe NewsletterSignupsController, :type => :controller do
  describe "POST create" do
    let(:nsignup) { double.as_null_object }
    let(:params) { {:name => "John Doe", :email => "jdoe@example.com"} }

    before :each do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      allow(NewsletterSignup).to receive(:new).and_return(nsignup)
    end
    

    it "instantiates a NewsletterSignup from params" do
      expect(NewsletterSignup).to receive(:new).with(params)
      post :create, :newsletter_signup => params
    end

    it "assigns the new NewsletterSignup to @newsletter_signup" do
      post :create, :newsletter_signup => params
      expect(assigns(:newsletter_signup)).to eq(nsignup)
    end

    it "tries to save the NewsletterSignup object" do
      expect(nsignup).to receive(:save)
      post :create, :newsletter_signup => params
    end

    context "when the NewsletterSignup saves succesfully" do
      before :each do
        allow(nsignup).to receive(:save).and_return(true)
      end

      it "sends a notification email" do
        allow(NewsletterMailer).to receive(:signup_notification).and_return(email = double)
        expect(email).to receive(:deliver)
        post :create, :newsletter_signup => params
      end
      
      it "redirects back to the page it came from" do
        post :create, :newsletter_signup => params
        expect(response).to redirect_to("where_i_came_from")
      end

      it "sets a flash notice" do
        post :create, :newsletter_signup => params
        expect(flash[:notice]).to_not be_nil
      end
    end

    context "when the NewsletterSignup doesn't save" do
      before :each do
        request.env["HTTP_REFERER"] = "http://example.com/"
        allow(nsignup).to receive(:save).and_return(false)
      end
      
      it "renders the referer" do
        post :create, :newsletter_signup => params
        expect(response).to render_template("welcome/index") # cause that's the root route
      end

      it "sets a flash alert" do
        post :create, :newsletter_signup => params
        expect(flash[:alert]).to_not be_nil
      end
    end
  end
end
