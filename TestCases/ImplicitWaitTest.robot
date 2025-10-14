*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
RegTest
    open browser  https://demowebshop.tricentis.com/register  chrome
    Maximize Browser Window
    ${impliciwait}=     get selenium implicit wait
    log to console   ${impliciwait}
    set selenium implicit wait   10  #plicable for all folowing locators
    select radio button     Gender      M
    ${impliciwait}=     get selenium implicit wait
    log to console   ${impliciwait}
    input text      name:FirstName      David
    input text      name:LastName1      John
    input text      name:Email          anhcl@gmail.com
    input text      name:Password       davidjohn
    input text      name:ConfirmPassword       davidjohn
    close browser