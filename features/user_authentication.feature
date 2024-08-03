Feature: User Authentication with OAuth

  Scenario: User logs in with Facebook and completes the registration form
    Given a team named "Team 1" exists
    And I am on the home page
    When I click on "Sign In with Facebook"
    And I submit the registration form
    Then I should be on the dashboard page
