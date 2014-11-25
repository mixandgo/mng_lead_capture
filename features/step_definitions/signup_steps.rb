Given(/^I fill in and submit the form$/) do
  fill_in "name-field", :with => "John Doe"
  fill_in "email-field", :with => "jdoe@email.com"
  fill_in "phone-field", :with => "0123456789"
  click_on "form-submit-btn"
end

Given(/^I fill in and submit the form with the same email$/) do
  step %{I fill in and submit the form}
end

Then /^I should see a notification$/ do
  step %{I should see "Thank you for subscribing"}
end

# This is worded like this because of the email steps.
And /^I expect to receive an email notification$/ do
  step %{"office@example.com" should receive an email}
end

When(/^I open my email$/) do
  %{"office@example.com" open the email with subject "New signup"}
end

Then(/^I should see the subscriber's details$/) do
  %{they should see "John Doe" in the email body}
  %{they should see "jdoe@email.com" in the email body}
end

And /^I should see a error notification$/ do
  step %{I should see "Email has already been taken"}
end

Given /^I\'ve already signed up$/ do
  create(:lead_signup, :email => "johndoe@example.com")
end

