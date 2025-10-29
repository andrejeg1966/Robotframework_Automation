*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
MouseActions
    open browser        https://swisnl.github.io/jQuery-contextMenu/demo.html   chrome
    maximize browser window
    #perfom the right click on button <<right click me>>
    mouse down          xpath://span[@class='context-menu-one btn btn-neutral']
    sleep   3
    mouse up            xpath://span[@class='context-menu-one btn btn-neutral']
    sleep   3
    open context menu   xpath://span[@class='context-menu-one btn btn-neutral']
    scroll element into View        xpath://*[@id="jquery-context-menu-demo-gallery"]
    sleep   3
    mouse down on link              xpath:/html/body/div/section/div/div/div/ul[2]/li[8]/a
    sleep   3
    mouse over          xpath:/html/body/div/section/div/div/div/ul[2]/li[8]/a
    sleep   3
    mouse out           xpath:/html/body/div/section/div/div/div/ul[2]/li[8]/a
    sleep   3

    #Double click action
    go to               https://testautomationpractice.blogspot.com/
    maximize browser window
    double click element    xpath://button[contains(text(), 'Copy Text')]
    sleep   3
   #Drag and drop action
                    #souece         target
   drag and drop        id:draggable    id:droppable
   sleep    2
   execute javascript   window.scrollTo(0,document.body.scrollHeight)       #end of the page
   sleep   2
   mouse down on link   xpath://*[@id="PageList1"]/div/ul/li[1]/a
   sleep   2
   mouse over           xpath://*[@id="PageList1"]/div/ul/li[2]/a
   sleep   2
   mouse out            xpath://*[@id="PageList1"]/div/ul/li[3]/a
   close browser