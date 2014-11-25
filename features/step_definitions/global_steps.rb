Given(/^I fill in and submit the form$/) do
  fill_in "name-field", :with => "John Doe"
  fill_in "email-field", :with => "jdoe@email.com"
  click_on "form-submit-btn"
end

Given(/^I fill in and submit the form with the same email$/) do
  step %{I fill in and submit the form}
end

Given(/^I (?:press|click on) "(.*?)"$/) do |button|
  click_on button
end

Then(/^I should be on the (.*?)$/) do |page_name|
  expect(current_path).to eq(path_to(page_name))
end

Given(/^I (?:am on|go to) the (.*?)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

Given(/^I've already subscribed$/) do
  create(:lead_signup, :email => "jdoe@email.com")
end

# Debugging tools
#
Then(/^Show me the page$/) do
  save_and_open_page
end

Given(/^PENDING/) do
  pending
end
