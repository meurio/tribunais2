Feature: login

  Background:
    Given there is a task "poke Gilmar Mendes"
    And there is a task "poke Rodrigo Janot"

  @javascript
  Scenario: when the user exists
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user accomplished "poke Gilmar Mendes"
    And I'm in "the homepage"
    And I click in "the login link"
    And I fill "the login email field" with "nicolas@trashmail.com"
    When I press "the login submit button"
    Then I should see "poke Gilmar Mendes" task accomplished
    When I click in "the logout link"
    Then I should see "poke Gilmar Mendes" task unaccomplished

  Scenario: when the user doesn't exists
