class LeadSignupsController < ApplicationController
  respond_to :json

  def create
    @lead_signup = LeadSignup.new(lead_signup_params)

    if @lead_signup.save
      LeadMailer.signup_notification(@lead_signup.id).deliver
    end

    respond_with @lead_signup
  end

  private

    def lead_signup_params
      params.require(:lead_signup).permit(:name, :email, :phone)
    end
end
