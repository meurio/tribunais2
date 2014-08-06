Feature: share on Facebook

  Background:
    Given there is a task "poke Gilmar Mendes"
    And there is a task "poke Rodrigo Janot"
    And there is a task "share on Facebook"

  @javascript
  Scenario: when the current task is to share on Facebook
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user accomplished "poke Gilmar Mendes"
    And this user accomplished "poke Rodrigo Janot"
    And I'm in "the homepage"
    And I click in "the login link"
    And I fill "the login email field" with "nicolas@trashmail.com"
    When I press "the login submit button"
    Then I should see "share on Facebook" task
    When I press "share on Facebook button"
    Then I should see "share on Facebook" task accomplished
