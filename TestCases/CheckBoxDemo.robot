*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}      chrome
${url}          http://demo.automationtesting.in/Register.html
*** Test Cases ***
Testing Check Boxes
    open browser    ${url}      ${browser}
    maximize browser window
    set selenium speed    2seconds
#checkbox
    page should contain checkbox    id:checkbox1
    page should not contain checkbox    id:checkboox1
                        #attribute id
    select checkbox    id:checkbox2
    checkbox should be selected     checkbox2
    select checkbox    checkbox1
    select checkbox    checkbox3
    unselect checkbox    checkbox1
    checkbox should not be selected     checkbox1
    close browser
*** Keywords ***