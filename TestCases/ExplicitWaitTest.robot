*** Settings ***
Library     SeleniumLibrary

*** Variables ***


*** Test Cases ***
Explicit wait test
    [Documentation]     Explicit wait is applicable only for those webelements which are specified by the user.
...                     Explixit wait requires expected condition like "Wait until elmenet is enabled"
    open browser        https://demowebshop.tricentis.com/register  chrome
    Maximize Browser Window

    Wait Until Page Contains                    Demo Web Shop
    Wait Until Page Contains Element            name:FirstName
    Wait Until Page Does Not Contain            Demo Web shop
    Wait Until Page Does Not Contain Element    name:firstname

    Wait Until Location Is                      https://demowebshop.tricentis.com/register
    Wait Until Location Is Not                  https://demowebshop.tricentis.com/register/ABC
    Wait Until Location Contains                register
    Wait Until Location Does Not Contain        registers


    Wait Until Element Is Enabled               //input[@id='register-button']
    Wait Until Element Is Visible               id:register-button
    Wait Until Element Is Not Visible           //input[@id='register-button_1']

    Wait Until Element Contains                 xpath://label[@for='FirstName']      First name:   timeout=5s
    Wait Until Element Does Not Contain         xpath://label[@for='FirstName']      First name :   timeout=5s
    close browser