*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
ScrolingTest
    Open Browser    https://www.countries-ofthe-world.com/flags-of-the-world.html  chrome
    Maximize Browser Window
    #this page isn't a web element, so need to use java script for scroling
    # second argument represent vertical scroll
    execute javascript  window.scrollTo(0,1500)
    sleep   5
    #scroll to particul element on the page
    scroll element into view    xpath://*[@id="ct-list"]/table[2]/tbody/tr[60]/td[1]/img
    sleep  5
    #scroll unitl end of the page
    execute javascript  window.scrollTo(0,document.body.scrollHeight)       #end of the page
    sleep   5
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)       #begin of the page
    sleep   5
    close browser

