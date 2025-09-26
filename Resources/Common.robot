*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${SAUCE_USERNAME} =    %{SAUCE_USERNAME}
${SAUCE_ACCESS_KEY} =  %{SAUCE_ACCESS_KEY}
${SAUCE_URL} =         https://${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}@ondemand.eu-central-1.saucelabs.com:443/wd/hub
${BROWSER} =           %{BROWSER:safari}    # Default to safari if not specified
${URL} =               https://automationplayground.com/crm/

*** Test Cases ***
Login Test
    [Documentation]    Test login functionality
    [Tags]    login    smoke
    Begin Web Test
    Click on Login Button
    # Add your login test steps here
    End Web Test

Search Test
    [Documentation]    Test search functionality
    [Tags]    search    smoke
    Begin Web Test
    Click on SearchButton
    # Add your search test steps here
    End Web Test

*** Keywords ***
Begin Web Test
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].SafariOptions()    sys, selenium.webdriver

    # Set browser capabilities based on parameter
    Run Keyword If    '${BROWSER}'.lower() == 'safari'    Set Safari Options    ${options}
    Run Keyword If    '${BROWSER}'.lower() == 'chrome'    Set Chrome Options    ${options}
    Run Keyword If    '${BROWSER}'.lower() == 'firefox'    Set Firefox Options    ${options}

    # Sauce-specific options
    ${sauce_opts}=    Create Dictionary
    ...    name=RobotFramework ${BROWSER} Test
    ...    seleniumVersion=4.21.0
    ...    username=${SAUCE_USERNAME}
    ...    accessKey=${SAUCE_ACCESS_KEY}

    Call Method    ${options}    set_capability    sauce:options    ${sauce_opts}

    Open Browser    ${URL}    browser=${BROWSER}    remote_url=${SAUCE_URL}    options=${options}
    Set Window Size    1920    1080
    Log    Starting CRM Test via Sauce Labs on ${BROWSER}!
    Wait Until Page Contains    Customers Are Priority One!

Set Safari Options
    [Arguments]    ${options}
    Call Method    ${options}    set_capability    browserName    safari
    Call Method    ${options}    set_capability    browserVersion    latest
    Call Method    ${options}    set_capability    platformName    OS X 10.10

Set Chrome Options
    [Arguments]    ${options}
    Call Method    ${options}    set_capability    browserName    chrome
    Call Method    ${options}    set_capability    browserVersion    latest
    Call Method    ${options}    set_capability    platformName    Windows 10

Set Firefox Options
    [Arguments]    ${options}
    Call Method    ${options}    set_capability    browserName    firefox
    Call Method    ${options}    set_capability    browserVersion    latest
    Call Method    ${options}    set_capability    platformName    Windows 10

End Web Test
    Run Keyword And Ignore Error    Capture Page Screenshot
    Close All Browsers

Click on SearchButton
    Click Link    xpath=//div[@class="hotBorder--3N6k"]/a

Click on Login Button
    Click Link    xpath=//*[@id="anonLogin"]/a