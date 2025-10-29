*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${actual_message1}=  I am an alert box!
${actual_message2}=  Press a button!

*** Test Cases ***
HandlingAlerts
    open browser    https://www.w3schools.com/JS/tryit.asp?filename=tryjs_alert     chrome
    maximize browser window
    sleep   3s
    select frame    id:iframeResult
    click button    xpath://html/body/button
    sleep   2s
    ${displayed_message1}=  handle alert    action=ACCEPT  timeout=2s
    #handle alert   ACCEPT
    Should Be Equal As Strings    ${displayed_message1}    ${actual_message1}

    Go To           https://www.w3schools.com/JS/tryit.asp?filename=tryjs_confirm
    maximize browser window
    sleep   3s
    select frame    id:iframeResult
    click button    xpath://html/body/button
    sleep   2s
    ${displayed_message2}=  handle alert    action=DISMISS  timeout=2s
    Should Be Equal As Strings    ${displayed_message2}    ${actual_message2}

    Go To           https://www.w3schools.com/JS/tryit.asp?filename=tryjs_prompt
    maximize browser window
    sleep   3s
    select frame    id:iframeResult
    click button    xpath://html/body/button
    Input Text Into Alert   Goran  action=ACCEPT
    sleep   2s
    current frame should contain     Hello Goran! How are you today?

    Go To           https://www.w3schools.com/JS/tryit.asp?filename=tryjs_alert2
    maximize browser window
    sleep   3s
    select frame    id:iframeResult
    click button    xpath://html/body/button
    sleep   2s
    Alert Should Be Present     text=Hello How are you?     action=ACCEPT


