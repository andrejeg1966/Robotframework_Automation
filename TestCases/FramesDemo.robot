*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Testing Frames W3schools
    open browser    https://www.w3schools.com/JS/tryit.asp?filename=tryjs_alert     chrome
    select frame    id:iframeResult
    current frame should contain     JavaScript Alert
    current frame should not contain     JavaScript Alert confirm two box
    unselect frame
    frame should contain    id:iframeResult  JavaScript Alert
    close browser