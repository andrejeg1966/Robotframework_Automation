*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
CloseAllBrowser
    open browser  https://demowebshop.tricentis.com/register  chrome
    Maximize Browser Window

    open browser  https://demo.nopcommerce.com/  chrome
    Maximize Browser Window
    #this command close only the latest statment
    #close browser

    close all browser