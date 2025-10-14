*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Verify search result
    #input text             //*[@id="gh-ac"]    mobile
    #input text              #name:_nkw    mobile  #id, name better to use than xpath or css
    input text              xpath://*[@id="gh-ac"]    mobile  #preferred method
    press keys              xpath://*[@id="gh-search-btn"]   [Return]
    #press keys              id:gh-search-btn   [Return]
    #press keys              css:#gh-search-btn   [Return]
    page should contain     iPhone
Filter results by condition
    mouse over              xpath://*[@id="w7"]/button/div
    sleep                   3
    mouse down              xpath://*[@id="w7"]/button/div/ul/li[2]
    click element           xpath://*[@id="w7"]/button/div/ul/li[2]

Verify filter result
    element should contain   xpath://*[@id="s0-2-54-0-9-8-4-4-0-3-0-1[0]-0-2-0-2-0-0-1-1-2-container"]/button[1]