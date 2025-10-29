*** Settings ***
Library  SeleniumLibrary



*** Keywords ***
#user defined keywords with arguments
LunchBrowser
    [Arguments]      ${appurl}  ${appbrowser}
    open browser     ${appurl}  ${appbrowser}
    maximize browser window
    ${title}=   get title
    RETURN    ${title}