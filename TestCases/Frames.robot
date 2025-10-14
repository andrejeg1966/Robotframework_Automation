*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Testing Frames
    open browser    https://www.selenium.dev/selenium/web/iframes.html     chrome
    select frame    iframe1    #id name xpath
    input text      id:email    admin@selenium.dev
    unselect frame
    sleep   3

    #select frame    title of second frame    #id name xpath
    #click link      link2
    #unselect frame
    #sleep   3
    #select frame    title of third frame    #id name xpath
    #click link      link3
    #unselect frame
    #close browser

Testing Frames W3schools
    open browser    https://www.w3schools.com/JS/tryit.asp?filename=tryjs_alert     chrome
    select frame    id:iframeResult
    current frame should contain     JavaScript Alert
    current frame should not contain     JavaScript Alert confirm two box
    unselect frame
    frame should contain    id:iframeResult  JavaScript Alert
    close browser