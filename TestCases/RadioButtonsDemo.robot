*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url_checkbox}      https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php
${url_radiobuttons}  https://www.selenium.dev/selenium/web/inputs.html

*** Test Cases ***
Testing check boxes
    Open Browser    ${url_checkbox}  ${browser}
    Maximize Browser Window
    set selenium speed  1seconds
    select checkbox     dob
    select checkbox     xpath://div[7]//div[1]//div[1]//div[2]//input[1]
    unselect checkbox   dob
    close browser

Testing radiobuttons
    Open Browser    ${url_radiobuttons}  ${browser}
    Maximize Browser Window
    set selenium speed  1seconds

    select radio button     radio_input     radio1
    select radio button     radio_input     radio2
    close browser
*** Keywords ***
