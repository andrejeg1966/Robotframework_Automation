*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC to demostrate Browser Window Operation Keywords in Robot Framework
    [Documentation]     TC to demostrate Browser Window Operation Keywords in Robot Framework
    open browser        https://www.tutorialspoint.com/selenium/practice/browser-windows.php          chrome   alias=ChromeRCV
    maximize browser window
    #execute javascript  window.scrollTo(0,200)
    sleep               3s

    Wait Until Element Is Visible       xpath://button[@title='New Tab']
    Click Button                        xpath://button[@title='New Tab']   #Click on button "New Tab"
    @{Window_Handles}           Get Window Handles
    sleep               3s
    @{Window_Identifier}        Get Window Identifiers
    sleep               3s
    @{Window_Name}              Get Window Names
    sleep               3s
    @{Window_Titles}            Get Window Titles
    sleep               3s
    Set Window Position     100     200
    ${x}    ${y}            Get Window Position
    log     ${x}
    log     ${y}
    Set Window Size         800     600
    ${Width}    ${Height}            Get Window Size
    log     ${Width}
    log     ${Height}
    Sleep               3s
    Switch Window           ${Window_Handles}[1]
    log     ${Window_Handles}[1]
    log many    @{Window_Handles}
    sleep               3s

    Switch Window           ${Window_Handles}[0]
    maximize browser window
    log     ${Window_Handles}[0]
    sleep               3s

    Switch Window           ${Window_Handles}[1]
    log     ${Window_Handles}[1]
    sleep               3s

    click link      xpath://html/body/div/header/div[3]/a   #click on link "Selenium Tutorial"
    maximize browser window
    sleep               3s
    @{Window_Handles}           Get Window Handles
    log     ${Window_Handles}[0]
    log     ${Window_Handles}[1]
    log     ${Window_Handles}[2]
    Close all browsers
