*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CUSTOMERS_HEADER_LABEL} =                  Our Happy Customers
${CUSTOMERS_HEADER_SUCCESS_LABEL} =          Success! New customer added.
${CUSTOMERS_ADD_CUSTOMER_LINK} =             id=new-customer
*** Keywords ***
Verify Page Loaded
    wait until page contains                 ${CUSTOMERS_HEADER_LABEL}

Click Add Customer Link
        click link                           ${CUSTOMERS_ADD_CUSTOMER_LINK}

Verify Customer Added Successfully
        wait until page contains             ${CUSTOMERS_HEADER_SUCCESS_LABEL}
