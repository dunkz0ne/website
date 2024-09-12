Feature: User Sign up

  Background: 
    Given a potential user named "Gieri"
    And "Gieri" has an email named "gieri@gmail.com"
    And "Gieri" has an NBA favorite team named "Lakers"
    And "Gieri" has a password named "Test@1234"

  #---------SAD PATH--------- 

  Scenario: "Gieri" has not inserted one or more fields in the registration form.
    Given "Gieri" on the sign up page
    When "Gieri" doesn't fill all field
    And "Gieri" submits the sign up form
    Then "Gieri" should see an error message

  Scenario: The password is too easy
    Given "Gieri" on the sign up page
    When "Gieri" choices a too easy password
    And "Gieri" submits the sign up form
    Then "Gieri" should see an error message

  #---------HAPPY PATH--------- 

  Scenario: "Gieri" sign up correctly.
    Given "Gieri" on the sign up page
    When "Gieri" fill the sign up form
    And "Gieri" submits the sign up form
    Then "Gieri" should be on the dashboard page
