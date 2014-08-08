Feature: poke Gilmar Mendes

  Background:
    Given there is a task "poke Gilmar Mendes"
    And there is a task "poke Rodrigo Janot"

  Scenario: when it's a new user
    Given I'm in "the homepage"
    And I fill "the first name field" with "Nícolas"
    And I fill "the last name field" with "Iensen"
    And I fill "the email field" with "nicolas@trashmail.com"
    When I press "the poke Gilmar Mendes submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Gilmar Mendes should be sent just once
    And an email from "guilherme@meurio.org.br" to "nicolas@trashmail.com" me should be sent
    And I should see "poke Rodrigo Janot" task
    And I should see "poke Gilmar Mendes" task accomplished

  Scenario: when it's an existing user
    Given the following user:
      | email | nicolas@trashmail.com |
    Given I'm in "the homepage"
    And I fill "the first name field" with "Nícolas"
    And I fill "the last name field" with "Iensen"
    And I fill "the email field" with "nicolas@trashmail.com"
    When I press "the poke Gilmar Mendes submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Gilmar Mendes should be sent just once
    And an email from "guilherme@meurio.org.br" to "nicolas@trashmail.com" me should be sent
    And I should see "poke Rodrigo Janot" task
    And I should see "poke Gilmar Mendes" task accomplished

  Scenario: when the user already poked Gilmar Mendes
    Given the following user:
      | email | nicolas@trashmail.com |
    And this user accomplished "poke Gilmar Mendes"
    And I'm in "the homepage"
    And I fill "the first name field" with "Nícolas"
    And I fill "the last name field" with "Iensen"
    And I fill "the email field" with "nicolas@trashmail.com"
    When I press "the poke Gilmar Mendes submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Gilmar Mendes should be sent just once
    And I should see "poke Rodrigo Janot" task
    And I should see "poke Gilmar Mendes" task accomplished

  @javascript
  Scenario: when the form contains errors
    Given I'm in "the homepage"
    When I press "the poke Gilmar Mendes submit button"
    Then I should see "the first name field error"
    And I should see "the last name field error"
    And I should see "the email field error"
