class NewsletterSignupsController < ApplicationController
  def create
    @newsletter_signup = NewsletterSignup.new(newsletter_signup_params)

    if @newsletter_signup.save
      NewsletterMailer.signup_notification(@newsletter_signup.id).deliver
      flash[:notice] = t('.create_success')
      redirect_to :back
    else
      flash[:alert] = t('.create_fail')
      render referer_template
    end
  end

  private

    def newsletter_signup_params
      params.require(:newsletter_signup).permit(:name, :email)
    end

    def referer_template
      hash = Rails.application.routes.recognize_path(request.referer)
      "#{hash[:controller]}/#{hash[:action]}"
    end
end
