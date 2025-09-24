*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Check Github Username
    #create the session
    Create Session    my_github_session     https://api.github.com

    #Make the call (and capture the response in a variable)
    ${response} =   Get   my_github_session     users/robotframeworktutorial

    #Check the response status
    should be equal as strings    ${response.status_code}   200

    #Check the response body
    ${json} =   set variable    ${response.json}
    should be equal as strings    ${json['login']}   robotframeworktutorial
    LOG    ${json}

Display Emoji
    LOG    Emoji...!!