Rails.application.routes.draw do
  resources :lead_signups, :defaults => { :format => :json }
end
