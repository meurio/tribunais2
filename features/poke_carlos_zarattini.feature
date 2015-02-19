Feature: poke Carlos Zarattini

  Background:
    Given there is a task "poke Gilmar Mendes"
    And there is a task "poke Rodrigo Janot"
    And there is a task "poke Carlos Zarattini"

  @javascript
  Scenario: when the current task is to poke Carlos Zarattini
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user accomplished "poke Gilmar Mendes"
    And this user accomplished "poke Rodrigo Janot"
    And I'm in "the homepage"
    And I click in "the login link"
    And I fill "the login email field" with "nicolas@trashmail.com"
    When I press "the login submit button"
    Then I should see "poke Carlos Zarattini" task
    When I press "the poke Carlos Zarattini submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Carlos Zarattini should be sent just once
    And I should see "poke Carlos Zarattini" task accomplished
