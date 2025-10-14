*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Browserstest
    open browser    https://google.com     chrome
    Maximize Browser Window
    sleep       3
    open browser    https://bing.com     chrome
    Maximize Browser Window

    switch browser  1
    ${title1}=  get title
    log to console  ${title1}
    sleep   3
    switch browser  2
    ${title2}=  get title
    log to console  ${title2}
    close all browsers


