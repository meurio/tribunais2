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
    And an email from "nicolas@trashmail.com" to Gilmar Mendes should be sent just once
    And I should see "poke Rodrigo Janot" task

  Scenario: when it's an existing user
    Given there is an user with email "nicolas@trashmail.com"
    Given I'm in "the homepage"
    And I fill "the first name field" with "Nícolas"
    And I fill "the last name field" with "Iensen"
    And I fill "the email field" with "nicolas@trashmail.com"
    When I press "the poke Gilmar Mendes submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Gilmar Mendes should be sent just once
    And I should see "poke Rodrigo Janot" task

  Scenario: when the user already poked Gilmar Mendes
    Given there is an user with email "nicolas@trashmail.com"
    And this user already poked Gilmar Mendes
    And I'm in "the homepage"
    And I fill "the first name field" with "Nícolas"
    And I fill "the last name field" with "Iensen"
    And I fill "the email field" with "nicolas@trashmail.com"
    When I press "the poke Gilmar Mendes submit button"
    Then I should be in "the homepage"
    And an email from "nicolas@trashmail.com" to Gilmar Mendes should be sent just once
    And I should see "poke Rodrigo Janot" task
