Feature: Lead signup
  In order to aquire readers for our website
  As a business
  We need a lead signup system

  Scenario: Guest signs up
    Given I am on the signup page
    When I fill in and submit the form
    Then I should see a notification
    And I expect to receive an email notification

  Scenario: Already signed up
    Given I am on the signup page
    And I've already signed up
    When I fill in and submit the form
    Then I should be on the lead signups page
    And I should see a error notification


