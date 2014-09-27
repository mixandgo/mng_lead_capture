class WelcomeController < ApplicationController
  def index
    @lead_signup = LeadSignup.new
  end
end
