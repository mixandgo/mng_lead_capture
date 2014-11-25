Given(/^I (?:am on|go to) the (.*?)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  expect(page).to_not have_content(text)
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
