Feature: The site
  In order to get to know who Reingard Riepenhausen was
  As an interested person
  I want to read about her a little bit

  Background: The page
    Given I am on the home page

  Scenario: Her name
    Then I should see "In memory of Reingard Riepenhausen" in the title
    And I should see "Reingard Riepenhausen" in the header

  Scenario: Her life and death dates
    Then I should see "1941 - 2010"

  Scenario: Homage
    Then I should see "Homage to Reingard by Pamela Cooper"
    And I should see "A tree is dying in my garden"
    And I should see "~ Thich Nhat Hanh"
