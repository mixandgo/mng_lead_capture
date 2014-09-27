require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "someone#{n}@example.com"
  end

  factory :lead_signup do
    sequence(:name) { |n| "John Doe#{n}" }
    email
  end
end
