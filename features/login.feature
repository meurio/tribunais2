Feature: login

  Background:
    Given 1 task

  @javascript
  Scenario: when the user exists
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user already poked Gilmar Mendes
    And I'm in "the homepage"
    And I click in "the login link"
    And I fill "the login email field" with "nicolas@trashmail.com"
    When I press "the login submit button"
    Then I should see "the poke Gilmar Mendes" task accomplished

  Scenario: when the user doesn't exists
