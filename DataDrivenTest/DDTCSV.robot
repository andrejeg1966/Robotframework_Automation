*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login_resources.robot
Library     DataDriver  ../TestData/LoginData.csv
Suite Setup         open my browser
Suite Teardown      close browsers
Test Template       Invalid Login

*** Test Cases ***
                                #come from csv file
#TC1_LoginWithCSV    using     ${username}     and     ${password}
Verify Login Fails with Invalid Creds    ${username}    ${password}

*** Keywords ***
Invalid Login
     [Arguments]        ${username}    ${password}
     sleep              2s
     input username     ${username}
     input pwd          ${password}
     click login button
     error message should be visible