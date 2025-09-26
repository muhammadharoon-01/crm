*** Settings ***
Documentation    This is some info about the whole suite

Resource    ../Resources/Common.robot
Resource    ../Resources/CrmApp.robot

#How to run
# robot -d results tests/crm.robot

Test Setup          Begin Web Test

Test Teardown       End Web Test

*** Variables ***
${VALID_LOGIN_EMAIL} =      abc@gmail.com
${VALID_LOGIN_PASSWORD} =   abc@g

#Add Customer Fields (FIXED THE EMAIL SYNTAX ERROR)
${ADD_CUSTOMER_EMAIL} =             janedoe@gmail.com
${ADD_CUSTOMER_FIRST_NAME} =        Jane
${ADD_CUSTOMER_LAST_NAME} =         Doe
${ADD_CUSTOMER_CITY} =              Dallas
${ADD_CUSTOMER_STATE} =             TX
${ADD_CUSTOMER_GENDER} =            male

*** Test Cases ***
Should be able to Login With Valid Credentials
    [Documentation]     Check Login with valid credentials.
    [Tags]              1001    Smoke   Login
    CrmApp.go to "home" page
    CrmApp.Login With Valid Credentials     ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}

Should be able to Logout
    [Documentation]     Login with valid credentials and logout.
    [Tags]              1002    Smoke   Logout
    CrmApp.go to "home" page
    CrmApp.Login With Valid Credentials     ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    CrmApp.Sign Out

Should be able to add new customer
    [Documentation]     Login with valid credentials and add new customer.
    [Tags]              1003    Smoke   AddCustomer
    CrmApp.go to "home" page
    CrmApp.Login With Valid Credentials     ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    CrmApp.Add New Customer    ${ADD_CUSTOMER_EMAIL}     ${ADD_CUSTOMER_FIRST_NAME}     ${ADD_CUSTOMER_LAST_NAME}     ${ADD_CUSTOMER_CITY}     ${ADD_CUSTOMER_STATE}     ${ADD_CUSTOMER_GENDER}
    CrmApp.Sign Out
