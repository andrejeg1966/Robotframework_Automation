*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/login_resources.robot
Suite Setup         open my browser
Suite Teardown      close browsers
Test Template       Invalid Login


*** Test Cases ***
TC1_right_user_empty_pwd    admin@yourstore.com         ${EMPTY}
TC2_right_user_wrong_pwd    admin@yourstore.com         wrong_pwd
TC3_wrong_user_right_pwd    wrong_user@yourstore.com    admin
TC4_wrong_user_empty_pwd    wrong_user@yourstore.com    ${EMPTY}
TC4_wrong_user_wrong_pwd    wrong_user@yourstore.com    wrong_pwd

*** Keywords ***
Invalid Login
     [Arguments]        ${username}    ${password}
     input username     ${username}
     input pwd          ${password}
     click login button
     error message should be visible


