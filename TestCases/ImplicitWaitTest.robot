*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Implicit wait test
    [Documentation]     Implicit wait is global. it is applicable for all webelements in the script
...                     so you do not specify "ExpectedConditions", This is wait time before throwing "No Such Element Exception"
    Set Browser Implicit Wait   5s
    open browser  https://demowebshop.tricentis.com/register  chrome
    Maximize Browser Window
    #default implicit wait
    ${impliciwait}=     get selenium implicit wait
    log to console   ${impliciwait}
    set selenium implicit wait   10  #plicable for all folowing locators
    ${impliciwait}=     get selenium implicit wait
    log to console   ${impliciwait}
    select radio button     Gender      M
    input text      name:FirstName      David
    input text      name:LastName       John
    input text      name:Email          anhcl@gmail.com
    input text      name:Password       davidjohn
    input text      name:ConfirmPassword       davidjohn
    close browser