@javascript
Feature: Lead signup
  In order to aquire readers for our website
  As a business
  We need a lead signup system

  Scenario: Guest signs up
    Given I am on the home page
    When I fill in and submit the form
    Then I should see "Thank you for subscribing"
    And "office@example.com" should receive an email with subject "New signup"

  Scenario: Owner receives the subscribers details
    Given I am on the home page
    And I fill in and submit the form
    When "office@example.com" open the email with subject "New signup"
    Then they should see "John Doe" in the email body
    And they should see "jdoe@email.com" in the email body

  Scenario: Already signed up
    Given I am on the home page
    And I've already subscribed
    When I fill in and submit the form with the same email
    Then I should see "Email has already been taken"
