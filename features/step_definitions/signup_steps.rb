
When /^I fill in and submit the form$/ do
  step %{I fill in "Full Name" with "John Doe"}
  step %{I fill in "E-mail" with "johndoe@example.com"}
  step %{I fill in "Phone (optional)" with "(1234)567-890"}
  step %{I click on "Sign Me Up"}
end

Then /^I should see a notification$/ do
  step %{I should see "Thank you for subscribing"}
end

# This is worded like this because of the email steps.
And /^I expect to receive an email notification$/ do
  step %{"office@example.com" should receive an email}
end

And /^I should see a error notification$/ do
  step %{I should see "We were unable to process your request, please try again."}
  step %{I should see "Email has already been taken"}
end

Given /^I\'ve already signed up$/ do
  create(:lead_signup, :email => "johndoe@example.com")
end

