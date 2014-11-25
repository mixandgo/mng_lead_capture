@javascript
Feature: Lead signup
  In order to aquire readers for our website
  As a business
  We need a lead signup system

  Scenario: Guest signs up
    Given I am on the signup page
    When I fill in and submit the form
    Then I should see a notification
    And I expect to receive an email notification

  Scenario: Owner receives the subscribers details
    Given I am on the signup page
    And I fill in and submit the form
    When I open my email
    Then I should see the subscriber's details

  Scenario: Already signed up
    Given I am on the signup page
    And I've already subscribed
    When I fill in and submit the form
    Then I should see a error notification
