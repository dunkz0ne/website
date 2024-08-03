Feature: User logged click on League Icon

  @requires_login
  Scenario: User logged click league icon
    Given I am logged in with Facebook
    And I am on the dashboard page
    When I click on the league link
    Then I should be on the league page
    And print the current path
