*** Settings ***
Documentation   Basic example input text by search and click functions
Library         Browser

*** Variables ***
${URL}=                     https://marketsquare.github.io/robotframework-browser/Browser.html
${SEARCH_FIELD}=            input[placeholder='Search']
${CLCIK_BROWSER_KEYWORD}=   //a[@class='match'][normalize-space()='Download']

*** Test Cases ***
Open Browser Page
    Open Webpage
    Search Keyword
    Click Keyword
    sleep   2s

*** Keywords ***
Open Webpage
    Open Browser    ${URL}
Search Keyword
    Fill Text       ${SEARCH_FIELD}     Download
Click Keyword
    Click           ${CLCIK_BROWSER_KEYWORD}