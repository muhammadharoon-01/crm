*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/DataManager.robot
Resource    ../Data/InputData.robot


*** Variables ***
${ENVIRONMENT} =    dev
${BROWSER} =    chrome
${URL} =    https://www.daraz.pk/

*** Test Cases ***
Should See Correct Error Messasges with Invalid Logins
    ${invalidLoginScenarios} =  DataManager.Get Csv Data    ${INVALID_CREDENTIALS_PATH_CSV}


Search Product on Daraz
    open browser    ${URL}
    Click on SearchButton