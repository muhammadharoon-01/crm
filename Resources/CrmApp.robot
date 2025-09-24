*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/AddCustomer.robot
Resource    ../Resources/PO/Customers.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/LoggedOut.robot
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/TopNav.robot

*** Variables ***


*** Keywords ***
Go To "Home" Page
    Home.Navigate To
    Home.Verify Page Loaded

Login With Valid Credentials
    [Arguments]    ${Email}     ${Password}
    TopNav.Clik Sign In Link
    SignIn.Verify Page Loaded
    SignIn.Login With Valid Credentials     ${Email}     ${Password}
    Customers.Verify Page Loaded


Add New Customer
    [Arguments]     ${Email}     ${FirstName}     ${LastName}     ${City}     ${State}     ${Gender}
    Customers.Click Add Customer Link
    AddCustomer.Verify Page Loaded
    AddCustomer.Add New Customer    ${Email}     ${FirstName}     ${LastName}     ${City}     ${State}     ${Gender}

Sign Out
    TopNav.Clik Sign Out Link
    LoggedOut.Verify Page Loaded



