*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
LoginTC
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  chrome
    Maximize Browser Window
    sleep       3
    input text      xpath://input[@name="username"]   Admin
    sleep       3
    input text      xpath://input[@name="password"]   admin123
    capture element screenshot  xpath://*[@id="app"]/div[1]/div/div[1]/div/div[1]/img  C:/Dev/Robotframework_Automation/log.png
    capture page screenshot    C:/Dev/Robotframework_Automation/logTC.png


