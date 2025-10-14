*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login_resources.robot
                                                    #optional
Library     DataDriver  ../../TestData/LoginData.xlsx  sheet_name=Sheet1
Suite Setup         open my browser
Suite Teardown      close browsers
Test Template       Invalid Login

*** Test Cases ***
                                #come from excel file
TC1_LoginWithExcel    using     ${username}     and     ${password}

*** Keywords ***
Invalid Login
     [Arguments]        ${username}    ${password}
     input username     ${username}
     input pwd          ${password}
     click login button
     error message should be visible