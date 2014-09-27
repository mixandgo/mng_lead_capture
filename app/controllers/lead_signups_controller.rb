class LeadSignupsController < ApplicationController
  def create
    @lead_signup = LeadSignup.new(lead_signup_params)

    if @lead_signup.save
      LeadMailer.signup_notification(@lead_signup.id).deliver
      flash[:notice] = t('.create_success')
      redirect_to :back
    else
      flash[:alert] = t('.create_fail')
      render referer_template
    end
  end

  private

    def lead_signup_params
      params.require(:lead_signup).permit(:name, :email)
    end

    def referer_template
      hash = Rails.application.routes.recognize_path(request.referer)
      "#{hash[:controller]}/#{hash[:action]}"
    end
end
