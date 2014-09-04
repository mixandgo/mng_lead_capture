Feature: Newsletter signup
  In order to aquire readers for our website
  As a business
  We need a newsletter signup system

  Scenario: Guest signs up
    Given I am on the home page
    When I fill in "Your Name" with "John Doe"
    When I fill in "and E-Mail" with "johndoe@example.com"
    And I click on "Sign Me Up"
    Then I should be on the home page
    And I should see "Thank you! You are now subscribed to our newsletter"
    And "office@example.com" should receive an email

  Scenario: Already signed up
    Given I am on the home page
    And I've already signed up for the newsletter with "johndoe@example.com"
    When I fill in "Your Name" with "John Doe"
    When I fill in "and E-Mail" with "johndoe@example.com"
    And I click on "Sign Me Up"
    Then I should be on the newsletter signups page
    And I should see "We were unable to process your request, please try again."
    And I should see "Email has already been taken"
