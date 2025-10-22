*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
HandlingAlerts
    open browser  https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window
    click element   xpath://*[@id="confirmBtn"]   #opens alert
    #//button[@id='alertBtn']
    sleep   2
    #alert should be present    Press a button!
    #alert should not be present    Press a button!
    #handle alert   dismiss  #cancel
    handle alert   accept
    #handle alert    leave   #keep leave



