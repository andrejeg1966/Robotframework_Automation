*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://demo.nopcommerce.com/
${url_google}   https://www.google.com/
${url_flipkart}  https://www.flipkart.com/

*** Test Cases ***
TestInputBox
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    title should be   nopCommerce demo store. Home page title
    Click Link  xpath://a[@class='ico-login']
    ${email_txt}    set variable    id:Email
    #check visibility enability of email box
    element should be visible   ${email_txt}
    element should be enabled   ${email_txt}
    input text  ${email_txt}    goran.andrejevic@web.de
    sleep   5
    clear element text  ${email_txt}
    sleep   3
    close browser

TestGoogle
    Open Browser    ${url_google}  ${browser}
    Wait Until Page Contains    ${url_google}
    Maximize Browser Window
    input text  xpath://textarea[@id='APjFqb']  Facebook
    click button    xpath://input[@name='btnK']
    close browser

ValidationTest
    Open Browser    ${url_flipkart}  ${browser}
    Wait Until Page Contains    ${url_flipkart}
    Maximize Browser Window




*** Keywords ***
