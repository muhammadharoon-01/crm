*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Begin Web Test
    #Initialize Selenium
    #set selenium speed    .2s
    set selenium timeout    10s

    #open the browser
    open browser        ${URL}   ${BROWSER}
    log                 Starting the test case!

    #Resize browser window for recording
    set window position    x=341    y=169
    set window size        width=1935  height=1090

    wait until page contains         Customers Are Priority One!

End Web Test
    close all browsers

Click on SearchButton
    #input text    id=q      wallet for men
    click link    xpath=//div[@class="hotBorder--3N6k"]/a

Click on Login Button
    input text    id=//*[@id="anonLogin"]/a