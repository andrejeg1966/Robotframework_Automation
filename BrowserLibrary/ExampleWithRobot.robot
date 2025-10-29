*** Settings ***
Library     Browser


*** Test Cases ***
My First Test
    [Documentation]    Gets, types and asserts
    New Page           https://example.cypress.io
    sleep               3s
    Click              "type"
    Get Url            *=    /commands/actions
    Type Text          .action-email    fake@email.com
    Get Text           .action-email    ==    fake@email.com

Has Title
    New Page            https://playwright.dev/
    Get Title           contains    Playwright

Get Started Link
    New Page            https://playwright.dev/
    ${element}=         Get Element By Role    LINK    name=Get started
    Click    ${element}
    ${heading}=         Get Element By Role      HEADING    name=Installation
    @{list_states}=     Get Element States    ${heading}        contains    visible     attached    enabled     defocused
    log to console      list_states:${list_states}

Get Started Link [Alternative]
    New Page                https://playwright.dev/
    Click                   a >> "Get started"
    Get Element States      h1    validate    value & visible       # Fails in case of an invisible element
    Get Element States      h1    then    value & (visible | hidden)
    ${visible_bool}=        Get Element States      h1    then    bool(value & visible)  # Returns ${True} if element is visible
    log to console          visible_bool:${visible_bool}
    @{list_states}=         Get Element States      h1 >> "Installation"    contains    visible     attached    enabled     defocused
    log to console          list_states:${list_states}

Playwright Test
    ${Page Details}=        New Page                https://playwright.dev/
    log to console          Page Details:${Page Details}
    Get Title               matches   modern web        #Playwright
    ${Attribute}=           Get Attribute           "Get started"    href    ==    /docs/intro
    log to console          Attribute:${Attribute}
    Click                   "Get started"
    Get Url                 matches    .*intro

Test Eight Components
    New Browser     chromium    headless=No
    New Page        https://www.selenium.dev/selenium/web/web-form.html
    Set Browser Timeout    0.5 sec
    Get Title    ==    Web form
    Type Text    [name="my-text"]    Selenium
    Click       button
    Get Text    id=message    ==    Received!

Test Keyword Filtering
    New Browser     Chromium    headless=False
    New Page        https://robotframework-browser.org/
    Set Browser Timeout    0.5 sec
    Get Title    ==    Browser Library
    Click    a >> "keyword documentation"
    Switch Page    NEW
    Get Title    ==    Browser
    Get URL    ends    robotframework-browser/Browser.html
    Type Text    input[placeholder="Search"]    Style
    ${style_elements}=    Get Elements    id=keyword-shortcuts-container >> a > span:has-text("Style")
    FOR    ${element}    IN    @{style_elements}
        Get Style    ${element}    background-color    ==    rgb(255, 255, 0)
    END
    Length Should Be    ${style_elements}    2