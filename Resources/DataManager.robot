*** Settings ***
Documentation    Use this layer to get data from external fiels.
Library    ../CustomLibs/CSV.py

*** Keywords ***
Get Csv Data
    [Arguments]    ${filePath}
    ${Data} =   Get Data From CSV    ${filePath}
    [Return]    ${Data}