*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC to demostrate Browser Operation Keywords in Robot Framework
    [Documentation]     TC to demostrate Browser Operation Keywords in Robot Framework
    open browser        https://www.google.com          chrome   alias=ChromeRCV
    maximize browser window       #ChromeRCV (last) browser is maximized
    open browser        about:blank                     ff       alias=RCVFF
    #maximize browser window       #FF (last) browser is maximized
    @{alias}           Get Browser Aliases
    log to console     alias_0:${alias}[0]
    log                alias_0:${alias}[0]
    log to console     alias_1:${alias}[1]
    log                alias_1:${alias}[1]
    @{browser_ID}      Get Browser Ids
    log to console     browser_ID_0:${browser_ID}[0]
    log                browser_ID_0:${browser_ID}[0]
    log to console     browser_ID_1:${browser_ID}[1]
    log                browser_ID_1:${browser_ID}[1]
    Switch Browser     1    #switch to chrome
    input text         name:q        RCVAcademy
    sleep              10s
    Switch Browser     ${alias}[1]      #browser FF
    Go To              https://www.salesforce.com
    sleep              3s
    Close all Browsers

