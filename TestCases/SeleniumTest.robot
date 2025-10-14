*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Login with correct Username and Password
    open browser    https://id.heroku.com/login     chrome
    Maximize Browser Window
    Sleep   10
    Close Browser

