Feature: Radionica

  @Radionica_Test
  Scenario Outline: Radionica_Test

    #KORAK 1 unos validnih podataka, Continue i Confirm your role str se otvara
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
    And Enter "company_registration_number" from Excel "<rowindex>"
    And Click on button "Continue"
    And Assert confirm your role page is loaded

    #KORAK 3 todo provjeriti info sa CUBE?

    #KORAK 4
    And Assert field "Company name" in company review page has value from excel "<rowindex>"
    And Assert company owner in company data page has value from excel "<rowindex>"
    And Assert there are no other info in confirm your role page


    #KORAK 7 - Postoji opcija izbora zakonskog zastupnika koji aplicira
    #KORAK 8 - Dugme "Back" je aktivno
    #KORAK 9 - Dugme "Continue" je aktivno, klikom na "Continue" otvara se sledec ekran "Consent"
    #TODO - drugi user

    #KORAK 10-19  - Na ekranu„Consent “ prikazane su sve tri saglasnosti, nisu cekirane, ...
    And Click on button "Continue"

    And Check if consents are displayed and not checked
    And Check if continue button is disabled
    And Validate Select all consents
    And Validate Continue button disabled withouth all consents
    And Validate Continue button enabled after all consents
    
    And Click on button "Cancel"
    And Confirm popup for cancel
    And Click on button "Withdraw your request"

#--------------------------------------------------------todo



    And Assert I have read Notice on the processing of personal data is valid
    And Assert company data page is loaded
    And Click on the toggle slider to confirm that I have read Notice on the processing of personal data
    And Click on button "Continue"
    And Assert contact details page is loaded
    And Enter valid phone number in company review page
    And Enter valid user email in company review page
    And Click on button "Continue"
    And Get redirect link with sms otp from email
    And Open link under key "link"
    And Assert email confirmed page is loaded
    And Click on button "Continue"
    And Assert phone number verification page is loaded
    And Enter otp from key "smsOtp"

    Then Assert consent page is loaded
    And Click on the toggle slider to consent to receive future offers from the bank regarding its products and services
    And Check if continue button is disabled
    And Click on the toggle slider to consent to electronic communication with the bank
    And Click on button "Continue"
    And Assert process is complete



    Examples:
      | rowindex |
      |        1 |


    # Koraci 8,9,10 iz testa, useri: mb: 20024623, mb: 06290965
@Vise_Vlasnika_Test
Scenario Outline: Vise_Vlasnika_Test

    #KORAK 1 unos validnih podataka, Continue i Confirm your role str se otvara
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
  And Enter "company_registration_number" from Excel "<rowindex>"
  And Click on button "Continue"
  And Assert confirm your role page is loaded

    #KORAK 3 todo provjeriti info sa CUBE?


  # KORAK 8 - Mogucnost izbora vlasnika (provera da na pocetku nije izabran ni jedan kao i da ne moze vise od jednog izabrati)
  And Assert only one representative can be selected at a time
  And Click on element by text "Back"
  # KORAK 9 Back button aktivan i kada nije selektovan zastupnik , user: 06290965
  And Select "CRN" as identifier type
  And Enter "company_registration_number" from Excel "6"
  And Click on button "Continue"
  And Assert confirm your role page is loaded
  And Click on element by text "Back"
  #KORAK 10
  And Select "CRN" as identifier type
  And Enter "company_registration_number" from Excel "6"
  And Click on button "Continue"
  And Assert confirm your role page is loaded
  #And Wait for element by text "Confirm your role in the company"
  #And Wait for element by text "Continue"
  And Assert button "Continue" is not clickable
  And Select first representative in company data page
  And Click on button "Continue"
  Then Assert consent page is loaded


  Examples:
    | rowindex |
    |        5 |


  @Radionica_Test_2
  Scenario Outline: Radionica_Test_2

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
    And Enter "company_registration_number_invalid" from Excel "<rowindex>"
    And Click on button "Continue"
    And Assert company review page is loaded
    And Enter valid phone number in company review page
    #And Enter valid email in company review page
    And Click on button "Continue"
    And Assert company data page is loaded
    And Select first representative in company data page
    And Check if continue button is disabled
    And Assert I have read Notice on the processing of personal data is valid
    And Assert company data page is loaded
    And Click on the toggle slider to confirm that I have read Notice on the processing of personal data
    And Click on button "Continue"
    And Assert contact details page is loaded
    And Enter valid phone number in company review page
    And Enter valid user email in company review page
    And Click on button "Continue"
    And Get redirect link with sms otp from email
    And Open link under key "link"
    And Assert email confirmed page is loaded
    And Click on button "Continue"
    And Assert phone number verification page is loaded
    And Enter otp from key "smsOtp"

    Then Assert consent page is loaded
    And Click on the toggle slider to consent to receive future offers from the bank regarding its products and services
    And Check if continue button is disabled
    And Click on the toggle slider to consent to electronic communication with the bank
    And Click on button "Continue"
    And Assert that the application cannot be completed online



    Examples:
      | rowindex |
      |        1 |


  @Radionica_Test_3
  Scenario Outline: Radionica_Test_3

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
    And Enter "company_registration_number" from Excel "<rowindex>"
    And Click on button "Continue"
    And Assert company review page is loaded
    And Assert field "Company name" in company review page has value from excel "<rowindex>"
    And Assert field "Registration number" in company review page has value from excel "<rowindex>"
    And Assert field "Tax identification number" in company review page has value from excel "<rowindex>"
    And Assert field "Company address" in company review page has value from excel "<rowindex>"
    And Assert input field for "email" in company review page has value from excel "<rowindex>"
    And Assert offered mobile phone prefix is "+3816"
    And Validate mobile phone in company review page
    And Enter valid phone number in company review page
    And Validate email field in company review page
    And Enter valid email in company review page
    And Click on button "Continue"
    And Assert company data page is loaded
    And Assert company owner in company data page has value from excel "<rowindex>"
    And Check if continue button is disabled
    And Assert I have read Notice on the processing of personal data is valid
    And Assert company data page is loaded
    And Click on the toggle slider to confirm that I have read Notice on the processing of personal data
    And Click on button "Continue"
    And Assert contact details page is loaded
    And Enter valid phone number in company review page
    And Enter valid user email in company review page
    And Click on button "Continue"
    And Get redirect link with sms otp from email
    And Open link under key "link"
    And Assert email confirmed page is loaded
    And Click on button "Continue"
    And Assert phone number verification page is loaded
    And Enter otp from key "smsOtp"

    Then Assert consent page is loaded
    And Click on the toggle slider to consent to receive future offers from the bank regarding its products and services
    And Check if continue button is disabled
    And Click on the toggle slider to consent to electronic communication with the bank
    And Click on button "Continue"
    And Assert that the application cannot be completed online



    Examples:
      | rowindex |
      |        1 |