*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Start test case
    open browser            https://ebay.com    chrome
    maximize browser window
Finish test case
    close browser