*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Input Search text and Click Search
    Input Text                  xpath://*[@id="gh-ac"]      mobile
    press keys                  xpath://*[@id="gh-search-btn"]   [Return]
Click on Advanced Search Link
    click element               xpath://*[@id="gh-f"]/div[2]/a