*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${search_text}=    iPhone
#${search_text}    mobile
${search_result}=    results for

*** Test Cases ***
Verify search result
    open browser            https://ebay.com    chrome
    maximize browser window
    input text              xpath://*[@id="gh-ac"]    ${search_text}
    press keys              xpath://*[@id="gh-search-btn"]   [Return]
    page should contain     ${search_result} ${search_text}
    close browser

*** Keywords ***
