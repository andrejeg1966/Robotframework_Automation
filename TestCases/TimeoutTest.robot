*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
RegTest
    open browser  https://demowebshop.tricentis.com/register  chrome
    Maximize Browser Window
    #timeout: global wait for webelements
    ${default_selenium_timeout}=     get selenium timeout
    ${default_seleniumspeed}=       get selenium speed
    log to console  ${default_selenium_timeout}
    log to console  ${default_seleniumspeed}
    #Sets the timeout that is used by various keywords.
    set selenium timeout    10s
    set selenium speed      2s  #always wait 2 s for each action
    #if page doesn't contain Registration, wait time is 5 seconds by default
    wait until page contains    Register
    select radio button     Gender      M
    input text      name:FirstName      David
    input text      name:LastName       John
    input text      name:Email          anhcl@gmail.com
    input text      name:Password       davidjohn
    input text      name:ConfirmPassword       davidjohn
    close browser
