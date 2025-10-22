*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}          https://www.saucedemo.com/
${browser}      chrome
${username}     id:user-name
${password}     id:password
${btn_login}    id:login-button
${error_text}   xpath://*[@id="login_button_container"]/div/form/div[3]/h3

*** Test Cases ***
Verify Login Fails - Wrong Username
    open browser    ${url}  ${browser}
    Maximize Browser Window
    input text    ${username}     standard_us
    input text    ${password}     secret_sauce
    click button  ${btn_login}
    sleep   2s
    element should contain  ${error_text}   Epic sadface: Username and password do not match any user in this service
    close browser

Verify Login Fails - LockedOutUser
    open browser    ${url}  ${browser}
    Maximize Browser Window
    input text    ${username}     locked_out_user
    input text    ${password}     secret_sauce
    click button  ${btn_login}
    sleep   2s
    element should contain  ${error_text}   Epic sadface: Sorry, this user has been locked out
    close browser

Verify Login Fails - Wrong Username and Passwort
    open browser    ${url}  ${browser}
    Maximize Browser Window
    input text    ${username}     standard_us
    input text    ${password}     secret_s
    click button  ${btn_login}
    sleep   2s
    element should contain  ${error_text}   Epic sadface: Username and password do not match any user in this service
    close browser

Verify Login Fails - Blank Username and Passwort
    open browser    ${url}  ${browser}
    Maximize Browser Window
    input text    ${username}     ${EMPTY}
    input text    ${password}     ${EMPTY}
    click button  ${btn_login}
    sleep   2s
    element should contain  ${error_text}   Epic sadface: Username is required
    close browser