Feature: NegativniScenariji

  @Invalid_MB_And_PIB
  Scenario Outline: Invalid_MB_And_PIB

    Given Open Login page
    And Wait for login page to load
    And Login to application using credentials from excel

    When Assert welcome back page has loaded
    And Select "Operation" as space to continue
    And Click on origination menu item
    And Click on New application
    And Select "SBB & PI lending" process
    And Assert "SBB & PI lending" is selected
    And Click on create button for process
    And Select "CRN" as identifier type
    And Enter "company_registration_number" from Excel
    And Click on button "Continue"
    And Assert element by text "Molimo Vas unesite validan matični broj firme"

    
    And Assert company review page is loaded
    And Assert field "Company name" in company review page has value from excel
    And Assert field "Registration number" in company review page has value from excel
    And Assert field "Tax identification number" in company review page has value from excel
    And Assert field "Company address" in company review page has value from excel
    And Assert input field for "email" in company review page has value from excel
    And Assert offered mobile phone prefix is "+3816"
    And Validate mobile phone in company review page
    And Enter valid phone number in company review page
    And Validate email field in company review page
    And Enter valid email in company review page
    And Click on button "Continue"
    And Assert company data page is loaded
    And Assert company owner in company data page has value from excel
    And Check if continue button is disabled
    And Assert I have read Notice on the processing of personal data is valid
    And Assert company data page is loaded
    And Click on the toggle slider to confirm that I have read Notice on the processing of personal data
    And Click on button "Continue"


    Examples:
      | rowindex |
      |        3 |
