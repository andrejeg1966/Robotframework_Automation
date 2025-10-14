*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
TabbedWindowtest
    open browser    https://www.tutorialspoint.com/selenium/practice/browser-windows.php     chrome
    click button    xpath://html/body/main/div/div/div[2]/button[1]
    sleep   3
    switch window   title=Selenium Practice - Web Tables
    sleep   5
    click link      xpath://html/body/div/header/div[3]/a
    sleep   3
    close all browsers
