*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/locators.py

*** Keywords ***
open my browser
    [Arguments]     ${SiteUrl}  ${Browser}
    open browser    ${SiteUrl}  ${Browser}
    Maximize Browser Window
enter username
    [Arguments]     ${username}
    input text      ${txt_LoginUserName}    ${username}
enter password
    [Arguments]     ${password}
    input text      ${txt_Paswsword}         ${password}
click SigIn
    click element   ${btn_Login}
verify succesfull login
    title should be     Dashboard / nopCommerce administration
close my browser
    close all browsers