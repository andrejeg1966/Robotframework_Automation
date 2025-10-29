*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/common.robot
Resource    ../TestData/ConfigData.robot

Suite Setup     Start TestCase
Suite Teardown  Finish TestCase
Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify Login Fails_Blank Username and Passwort    ${EMPTY}          ${EMPTY}       Epic sadface: Username is required
Verify Login Fails_Wrong Username                 standard_us       secret_sauce   Epic sadface: Username and password do not match any user in this service
Verify Login Fails_LockedOutUser                  locked_out_user   secret_sauce   Epic sadface: Sorry, this user has been locked out
Verify Login Fails_Wrong Username and Passwort    standard_us       secret_s       Epic sadface: Username and password do not match any user in this service
Verify Login Fails_Wrong Passwort                 standard_user     secret_s       Epic sadface: Username and password do not match any user in this service
#Verify Login Fails_Blank Username                 ${EMPTY}          secret_sauce       Epic sadface: Username and password do not match any user in this service
#Verify Login Fails_Blank Passwort                 standard_user     ${EMPTY}       Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Invalid Login Scenarios
    [Arguments]    ${username}     ${password}     ${error_msg}
    Input Text      ${textBox_username}     ${username}
    Input Text      ${textBox_password}     ${password}
    Click Button    ${btn_login}
    sleep           2s
    element should contain  ${error_text}   ${error_msg}