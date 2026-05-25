Feature: NegativniScenariji

  @Invalid_MB_And_PIB
  Scenario Outline: Invalid_MB_And_PIB

    Given Open Login page
    And Wait for login page to load
    And Login to application using credentials from excel "<rowindex>"

    When Assert welcome back page has loaded
    And Select "Operation" as space to continue
    And Click on origination menu item
    And Click on New application
    And Select "SBB & PI lending" process
    And Assert "SBB & PI lending" is selected
    And Click on create button for process
    And Select "CRN" as identifier type
    #KORAK 3: neispravan mb 50100796
    And Enter "company_registration_number" from Excel "<rowindex>"
    And Click on button "Continue"

    #And Assert element by text "Molimo Vas unesite validan matični broj firme"
    And Assert element by text "Molimo Vas unesite validan matični broj firme" index "1"
    #KORAK 6:, user: 06027415 - status u stecaju
    And Select "CRN" as identifier type
    And Enter "company_registration_number" from Excel "7"
    And Click on button "Continue"
    And Assert that your request was not approved page is loaded


    Examples:
      | rowindex |
      |        4 |

  @Invalid_MB_And_PIB_Not_In_SBB
  Scenario Outline: Invalid_MB_And_PIB_Not_In_SBB

    Given Open Login page
    And Wait for login page to load
    And Login to application using credentials from excel "<rowindex>"

    When Assert welcome back page has loaded
    And Select "Operation" as space to continue
    And Click on origination menu item
    And Click on New application
    And Select "SBB & PI lending" process
    And Assert "SBB & PI lending" is selected
    And Click on create button for process
    And Select "CRN" as identifier type
    #KORAK 6: nije u sbb segmentu
    And Enter "company_registration_number" from Excel "<rowindex>"
    And Click on button "Continue"
    And Assert that your request was not approved page is loaded


    Examples:
      | rowindex |
      |        8 |
