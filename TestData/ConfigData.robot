*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}          https://www.saucedemo.com/
${browser}      chrome
${textBox_username}     id:user-name
${textBox_password}     id:password
${btn_login}    id:login-button
${error_text}   xpath://*[@id="login_button_container"]/div/form/div[3]/h3