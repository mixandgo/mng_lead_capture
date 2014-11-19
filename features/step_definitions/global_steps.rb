Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, :with => value
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
  expect(page).to_not have_content(text)
end


# Debugging tools
#
Then(/^Show me the page$/) do
  save_and_open_page
end

Given(/^PENDING/) do
  pending
end
