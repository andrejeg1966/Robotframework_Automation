*** Settings ***
Library  SeleniumLibrary
Resource    ../TestData/ConfigData.robot

*** Keywords ***
Start TestCase
    open browser    ${url}  ${browser}
    Maximize Browser Window
    sleep   2s
Finish TestCase
    close browser