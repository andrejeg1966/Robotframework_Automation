*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/login_resources.robot
Suite Setup         open my browser
Suite Teardown      close browsers
Test Template       Valid Login

*** Test Cases ***
TC1_right_user_right_pwd    admin@yourstore.com     admin

*** Keywords ***
Valid Login
     [Arguments]        ${username}    ${password}
     input username     ${username}
     input pwd          ${password}
     click login button
     dashboard page should be visible
