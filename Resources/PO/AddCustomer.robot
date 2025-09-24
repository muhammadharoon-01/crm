*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADD_CUSTOMER_HEADER_LABEL} =              Add Customer
${ADD_CUSTOMER_EMAIL_TEXTBOX} =             id=EmailAddress
${ADD_CUSTOMER_FIRST_NAME_TEXTBOX} =        id=FirstName
${ADD_CUSTOMER_LAST_NAME_TEXTBOX} =         id=LastName
${ADD_CUSTOMER_CITY_TEXTBOX} =              id=City
${ADD_CUSTOMER_STATE_DROPDOWN} =            id=StateOrRegion
${ADD_CUSTOMER_GENDER_RADIO} =              gender
${ADD_CUSTOMER_PROMO_CHECKBOX} =            name=promos-name
${ADD_CUSTOMER_SUBMIT_BUTTON} =             Submit

*** Keywords ***
Verify Page Loaded
    wait until page contains        ${ADD_CUSTOMER_HEADER_LABEL}


Add New Customer
    [Arguments]     ${Email}     ${FirstName}     ${LastName}     ${City}     ${State}     ${Gender}
    Fill "Email" Field              ${Email}
    Fill "First Name" Field         ${FirstName}
    Fill "Last Name" Field          ${LastName}
    Fill "City" Field               ${City}
    Fill "State" Field              ${State}
    Select "Gender" Radio           ${Gender}
    Select "Promo" CheckBox
    Click Submit Button

Fill "Email" Field
    [Arguments]     ${Email}
    input text                       ${ADD_CUSTOMER_EMAIL_TEXTBOX}           ${Email}

Fill "First Name" Field
    [Arguments]     ${FirstName}
    input text                       ${ADD_CUSTOMER_FIRST_NAME_TEXTBOX}      ${FirstName}

Fill "Last Name" Field
    [Arguments]     ${LastName}
    input text                       ${ADD_CUSTOMER_LAST_NAME_TEXTBOX}       ${LastName}

Fill "City" Field
    [Arguments]     ${City}
    input text                       ${ADD_CUSTOMER_CITY_TEXTBOX}            ${City}

Fill "State" Field
    [Arguments]     ${State}
    select from list by value        ${ADD_CUSTOMER_STATE_DROPDOWN}          ${State}

Select "Gender" Radio
    [Arguments]     ${Gender}
    select radio button              ${ADD_CUSTOMER_GENDER_RADIO}          ${Gender}

Select "Promo" CheckBox
    select checkbox                  ${ADD_CUSTOMER_PROMO_CHECKBOX}

Click Submit Button
    click button                ${ADD_CUSTOMER_SUBMIT_BUTTON}