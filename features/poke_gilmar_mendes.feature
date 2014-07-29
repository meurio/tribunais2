Feature: poke Gilmar Mendes

  Background:
    Given there is a task for poke Gilmar Mendes

  Scenario: when it's a new user
    Given I'm in "the homepage"
    And I fill "the first name field" with "Nícolas"
    And I fill "the last name field" with "Iensen"
    And I fill "the email field" with "nicolas@trashmail.com"
    When I press "the poke Gilmar Mendes submit button"
    Then I should be in "the homepage"
    And my email to Gilmar Mendes should be sent
    And I should see "poke Rodrigo Janot" task

  Scenario: when it's an existing user
  Scenario: when the user already poked Gilmar Mendes
