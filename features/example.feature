Feature: My Rap name

  Scenario: Male name suggestion with Firstname and Nickname
    Given I am on the homepage
    Then I verify input field for "firstname" exists
    When I enter "Asad" in the  "Firstname" field
    And I verify checkbox is checked for "Nickname"
    And I click "Suggest Male" button "1" time
    Then I verify a new name has been prepended to the list in "First" row

 Scenario: Female name suggestion with Firstname and Last initials
    Given I am on the homepage
    When I enter "Asad" in the  "Firstname" field
    And I enter "U" in the  "Last Initial" field
    And I uncheck checkbox for "Nickname"
    And I click "Suggest Female" button "2" times
    Then I verify a new name has been prepended to the list in "First" row
    And I verify a new name has been prepended to the list in "Second" row

@negative_scenario
Scenario: No name suggestion with empty Firstname
    Given I am on the homepage
    When I enter "" in the  "Firstname" field
    And I click "Suggest Male" button "1" time
    Then I see the text "You must enter your first name"

@negative_scenario
Scenario Outline: Firstname input field doesn't support special character
    Given I am on the homepage
    When I enter "<NameWithSpecialChar>" in the  "Firstname" field
    And I click "Suggest Male" button "1" time
    Then I verify "firstname" input field only accepted alpha numeric value

    Examples:
    |NameWithSpecialChar       |
    |Asad&&%                   |
    |Za&ma*n/                  |
    |*&^%$#                    |