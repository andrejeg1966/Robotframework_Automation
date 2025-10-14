*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
RegTest
    open browser  https://demowebshop.tricentis.com/register  chrome
    Maximize Browser Window
    ${timeout}=     get selenium timeout
    log to console  ${timeout}
    #if page doesn't contain Registration, wait time is 5 seconds by default
    set selenium timeout    10
    wait until page contains    Registration
    select radio button     Gender      M
    input text      name:FirstName      David
    input text      name:LastName       John
    input text      name:Email          anhcl@gmail.com
    input text      name:Password       davidjohn
    input text      name:ConfirmPassword       davidjohn
    close browser
