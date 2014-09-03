class WelcomeController < ApplicationController
  def index
    @newsletter_signup = NewsletterSignup.new
  end
end
