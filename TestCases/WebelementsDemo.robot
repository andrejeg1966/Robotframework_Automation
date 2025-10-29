*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC to demostrate Browser Operation Keywords in Robot Framework
    [Documentation]     TC to demostrate Browser Operation Keywords in Robot Framework
    open browser        https://www.google.com          chrome   alias=ChromeRCV
    maximize browser window
    sleep               4s
    #${attr}=    Get Element Attribute   //div[@class='FPdoLc lJ9FBc']//input[@name='btnK']  class  #inspect surch button
    ${attr}=    Get Element Attribute   //input[@name='btnK']   class  #inspect surch button
    log to console     attr:${attr}
    ${count}=   Get Element Count       //input[@name='btnK']
    log to console     count:${count}
    ${width}    ${higth}        Get Element Size    //input[@name='btnK']     #Returns width and height of the element identified by locator.
    log to console     width:${width}
    log to console     higth:${higth}
    Get WebElement    //input[@name='btnK']         #Returns the first WebElement matching the given locator.
    @{webelements}    Get WebElements   //input[@name='btnK']                #Returns a list of WebElement objects matching the locator.
    log many          @{webelements}
    Capture Element Screenshot  name:q
    Assign Id To Element        name:btnK               RCVId               #Assign to button google search temporary id wit value RCVId
    sleep               4s
    Page Should Contain Element    RCVId
    #Element Should Be Focused      name:q                                  #search text box
    Element Should Be Visible      name:q
    Input Text                     name:q   RCVAcademy
    sleep               4s
    Clear Element Text             name:q
    sleep               4s
    cover element       id:gbqfbb                                           #button Auf gut Glueck
    sleep               4s
    Element Attribute Value Should Be   name:btnK   value   Google Suche
    Element Should Be Enabled           name:btnK
    Element Should Not Be Visible       name:btnKWWW
    Element Should Contain              //a[normalize-space()='Wie funktioniert die Google Suche?']    Wie funktioniert
    Element Should Not Contain          //a[normalize-space()='Wie funktioniert die Google Suche?']    Bing
    Element Text Should Be              //a[normalize-space()='Wie funktioniert die Google Suche?']    Wie funktioniert die Google Suche?
    Element Text Should Not Be          //a[normalize-space()='Wie funktioniert die Google Suche?']    Wie funktioniert
    Double Click Element                xpath://a[@aria-label='Anmelden']
    ${horizontalPos}=                   Get Horizontal Position            //span[normalize-space()='Konto erstellen']
    ${verticalPos}=                     Get Vertical Position              //span[normalize-space()='Konto erstellen']
    log to console     horizontalPos:${horizontalPos}
    log to console     verticalPos:${verticalPos}
    Click Element At Coordinates       //span[normalize-space()='Konto erstellen']    1  2
    close browser

