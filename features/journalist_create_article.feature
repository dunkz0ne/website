Feature: Journalist create an article

  Scenario: Journalist logged create an article
    Given I am logged in with Facebook
    And I am a Journalist
    When I click on the New Article link
    And I submit the article form
    Then I should see the article in the list of articles
