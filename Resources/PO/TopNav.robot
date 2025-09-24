*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TOPNAV_SIGNIN_LINK} =     id=SignIn
${TOPNAV_SIGNOUT_LINK} =     Sign Out

*** Keywords ***
Clik Sign In Link
    click link              ${TOPNAV_SIGNIN_LINK}

Clik Sign Out Link
    click link              ${TOPNAV_SIGNOUT_LINK}