require 'rails_helper'

RSpec.describe LeadSignupsController, :type => :controller do
  describe "POST create" do
    let(:params) { attributes_for(:lead_signup) }

    it "instantiates a LeadSignup from params" do
      expect(LeadSignup).to receive(:new).with(params).and_call_original
      xhr :post, :create, :lead_signup => params
    end

    it "assigns the new LeadSignup to @lead_signup" do
      xhr :post, :create, :lead_signup => params
      expect(assigns(:lead_signup)).to be_a(LeadSignup)
    end

    it "saves the LeadSignup object" do
      expect_any_instance_of(LeadSignup).to receive(:save).and_call_original
      xhr :post, :create, :lead_signup => params
    end

    context "when the LeadSignup saves succesfully" do
      it "sends a notification email" do
        allow(LeadMailer).to receive(:signup_notification).and_return(email = double)
        expect(email).to receive(:deliver)
        xhr :post, :create, :lead_signup => params
      end

      it "returns the object as JSON" do
        xhr :post, :create, :lead_signup => params
        body = JSON.parse(response.body)
        expect(body["name"]).to eq(params[:name])
        expect(body["email"]).to eq(params[:email])
      end
    end

    context "when the LeadSignup doesn't save" do
      it "returns the errors in a JSON object" do
        xhr :post, :create, :lead_signup => {:name => nil, :email => nil}
        body = JSON.parse(response.body)
        expect(body["errors"]).to eq({"name"=>["can't be blank"], "email"=>["can't be blank"]}
)
      end
    end
  end
end
