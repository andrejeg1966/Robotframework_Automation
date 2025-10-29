*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}      chrome
${url}      http://demo.automationtesting.in/Register.html
*** Test Cases ***
Testting Radio Buttons and Check Boxes
    open browser    ${url}      ${browser}
    maximize browser window
    set selenium speed    2seconds
#Radio Buttons
    page should contain radio button    xpath:(//input[@name='radiooptions'])
    page should not contain radio button    xpath:(//input[@name='radiooptions123'])
    radio button should not be selected    radiooptions
                           #attribute name  #attribute value
    select radio button    radiooptions     FeMale
    select radio button    radiooptions     Male
    radio button should be set to    radiooptions   Male
    close browser
*** Keywords ***

