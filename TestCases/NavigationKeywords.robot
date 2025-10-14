*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Browserstest
    open browser    https://google.com     chrome

    ${loc}=     get location
    log to console  ${loc}
    sleep   3

    go to   https://bing.com
    log to console  ${loc}
    sleep   3

    go back
    sleep   3
    close all browsers
