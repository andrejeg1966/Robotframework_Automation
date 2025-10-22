*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://demo.nopcommerce.com/
${browser}  chrome


*** Test Cases ***
LoginTest
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    loginToApplication
    Close Browser

*** Keywords ***
loginToApplication
    Click Link  xpath://a[@class='ico-login']
    Input Text  id:Email    goran.andrejevic@web.de
    Input Text  id:Password  Velesnica1966?
    Click Element   xpath://button[@class='button-1 login-button']
    #Click Element   xpath://button[normalize-space()='Log in']









