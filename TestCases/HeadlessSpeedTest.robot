*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#Headless tests are executed in the backend. It is not visible. The purpose is to accelerate test execution.
*** Test Cases ***
RegTest
    open browser  https://demowebshop.tricentis.com/register  headlesschrome
    Maximize Browser Window
    #only statament above is delated 3 sec
    #sleep  3
    #initialy by default selenium is 0 second
    ${speed}=   get selenium speed
    log to console  ${speed}
    set selenium speed  2
    #which statement belov is delated 2 seconds
    select radio button     Gender                    M
    input text              name:FirstName            David
    input text              name:LastName             John
    input text              name:Email                anhcl@gmail.com
    input text              name:Password             davidjohn
    input text              name:ConfirmPassword      davidjohn
    ${speed}=   get selenium speed
    log to console  ${speed}