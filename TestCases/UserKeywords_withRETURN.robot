*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/resources.robot


*** Variables ***
${url}  https://demo.nopcommerce.com/
${browser}  chrome


*** Test Cases ***
LoginTest
    ${pageTitle}=   LunchBrowser    ${url}  ${browser}
    log to console  ${pageTitle}
    #print the title in the report
    log     ${pageTitle}
    Click Link  xpath://a[@class='ico-login']
    Input Text  id:Email    goran.andrejevic@web.de
    Input Text  id:Password  Velesnica1966?
    Click Element   xpath://button[@class='button-1 login-button']




