*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
MouseActions
    open browser    https://swisnl.github.io/jQuery-contextMenu/demo.html   chrome
    maximize browser window
    #perfom the right click on button <<right click me>>
    open context menu   xpath://span[@class='context-menu-one btn btn-neutral']
    sleep   3

    #Double click action
    go to   https://testautomationpractice.blogspot.com/
    maximize browser window
    double click element    xpath://button[contains(text(), 'Copy Text')]
    sleep   3

    #Drag and drop action
                    #souece         target
   drag and drop    id:draggable    id:droppable
   sleep    5
   close browser