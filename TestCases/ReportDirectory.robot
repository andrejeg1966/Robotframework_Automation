*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
This is simple test case
    [Documentation]     Google Test
    [tags]              regression

    open browser        https://www.google.com/     chrome
    close browser
    #Execute command: robot -d Results .\TestCases\GoogleSearch.robot

*** Keywords ***
