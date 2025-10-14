*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://admin-demo.nopcommerce.com
${BROWSER}      chrome

*** Keywords ***
open my browser
    open browser    ${LOGIN URL}   ${BROWSER}
    Maximize Browser Window

close browsers
    close all browsers

open login page
    go to   ${LOGIN URL}

input username
    [Arguments]     ${username}
    input text      id:Email    ${username}

input pwd
    [Arguments]     ${password}
    input text      id:Password    ${password}

click login button
    click element   xpath://button[@type='submit']

click logout link
    #click element  xpath://a[normalize-space()='Logout']
    click link      Logout


                 #Validation
error message should be visible
    page should contain     Login was unsuccessful

dashboard page should be visible
    page should contain     Dashboard