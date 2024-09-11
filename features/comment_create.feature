Feature: User create a comment, like and save it

  Scenario: User logged create a comment, like and save it
    Given I am logged in with Facebook
    And I am on article page
    When I submit the form
    Then I should view the comment
    And click on like and save button
    When I visit profile page
    And I should view the comment