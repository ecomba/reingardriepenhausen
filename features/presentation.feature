Feature: The site
  In order to get to know who Reingard Riepenhausen was
  As an interested person
  I want to read about her a little bit

  Background: The page
    Given I am on the home page

  Scenario: Her name
    Then I should see "In memory of Reingard Riepenhausen" in the title
    And I should see "In memory of Reingard Riepenhausen" in the header
