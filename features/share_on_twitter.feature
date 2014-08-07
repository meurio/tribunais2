Feature: share on Twitter

  Background:
    Given there is a task "poke Gilmar Mendes"
    And there is a task "poke Rodrigo Janot"
    And there is a task "share on Facebook"
    And there is a task "share on Twitter"

  @javascript
  Scenario: when the current task is to share on Twitter
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user accomplished "poke Gilmar Mendes"
    And this user accomplished "poke Rodrigo Janot"
    And this user accomplished "share on Facebook"
    And I'm in "the homepage"
    And I click in "the login link"
    And I fill "the login email field" with "nicolas@trashmail.com"
    When I press "the login submit button"
    Then I should see "share on Twitter" task
    When I press "share on Twitter button"
    Then I should see "share on Twitter" task accomplished
