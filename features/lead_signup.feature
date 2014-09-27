Feature: Lead signup
  In order to aquire readers for our website
  As a business
  We need a lead signup system

  Scenario: Guest signs up
    Given I am on the home page
    When I fill in "Your Name" with "John Doe"
    When I fill in "and E-Mail" with "johndoe@example.com"
    And I click on "Sign Me Up"
    Then I should be on the home page
    And I should see "Thank you for subscribing"
    And "office@example.com" should receive an email

  Scenario: Already signed up
    Given I am on the home page
    And I've already signed up with "johndoe@example.com"
    When I fill in "Your Name" with "John Doe"
    When I fill in "and E-Mail" with "johndoe@example.com"
    And I click on "Sign Me Up"
    Then I should be on the lead signups page
    And I should see "We were unable to process your request, please try again."
    And I should see "Email has already been taken"