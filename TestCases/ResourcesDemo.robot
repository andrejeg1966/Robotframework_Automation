*** Settings ***
Documentation   Basic search functionality
Resource        ../Resources/CommonFunctionality.robot
Resource        ../Resources/PageObjects/HeaderPage.robot
Resource        ../Resources/PageObjects/SearchResultPage.robot

Test Setup      CommonFunctionality.Start test case
Test Teardown   CommonFunctionality.Finish test case

*** Variables ***

*** Test Cases ***
TC_Verify_basic_search_eBay
    [Documentation]     This test case verifies the basic search
    [Tags]              Funtional
    HeaderPage.Input Search text and Click Search
    SearchResultPage.Verify Search Result

TC_Verify_advanced_search_eBay
    [Documentation]     This test case verifies the advanced search
    [Tags]              Funtional
    HeaderPage.Click on Advanced Search Link

