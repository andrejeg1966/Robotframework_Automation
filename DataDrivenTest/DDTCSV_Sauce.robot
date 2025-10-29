*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/common.robot
Resource    ../TestData/ConfigData.robot
Library     DataDriver  ../TestData/TestData.csv

Suite Setup     Start TestCase
Suite Teardown  Finish TestCase
Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify Login Fails with Invalid Creds   ${username}     ${password}     ${error_msg}

*** Keywords ***
Invalid Login Scenarios
    [Arguments]     ${username}     ${password}     ${error_msg}
    Input Text      ${textBox_username}     ${username}
    Input Text      ${textBox_password}     ${password}
    Click Button    ${btn_login}
    sleep           2s
    element should contain  ${error_text}   ${error_msg}