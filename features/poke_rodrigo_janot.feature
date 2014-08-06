Feature: poke Rodrigo Janot

  Background:
    Given there is a task "poke Gilmar Mendes"
    And there is a task "poke Rodrigo Janot"

  @javascript
  Scenario: when the current task is to poke Rodrigo Janot
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user accomplished "poke Gilmar Mendes"
    And I'm in "the homepage"
    And I click in "the login link"
    And I fill "the login email field" with "nicolas@trashmail.com"
    When I press "the login submit button"
    Then I should see "poke Rodrigo Janot" task
    When I press "the poke Rodrigo Janot submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Rodrigo Janot should be sent just once
    And I should see "poke Rodrigo Janot" task accomplished

