*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://bing.com/
${browser}  chrome

*** Test Cases ***
Test Case to demonstrate FOR LOOP in Robot Framwwork
    [Documentation]     Test Case to demonstrate FOR LOOP in Robot Framwwork
    Set Selenium implicit wait  5s
    open browser    ${url}  ${browser}
    maximize browser window
    input text  name:q  RCV Academy
    press keys  xpath://*[@id="sb_form_q"]  RETURN
    #list 
    @{results_on_page}=     Get WebElements     xpath://*[@id='rso']/div
    log to console  results_on_page:${results_on_page}
    FOR     ${element}  IN  @{results_on_page}
        ${text}=    Get Text   ${element}
        log to console  ${text}
        log             ${text}
    END

    Close Browser

