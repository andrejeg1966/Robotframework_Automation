*** Settings ***
Suite Setup     log to console     Opening Browser
Suite Teardown  log to console     Closing Browser

Test Setup      log to console     Login to Application
Test Teardown   log to console     Logout from Application

*** Test Cases ***
TC1 Prepaid test case
    log to console  this is prepaid test case
TC2 Postpaid test case
    log to console  this is postpaid test case
TC3 Search test case
    log to console  this is search test case
TC4 Advanced search test case
    log to console  this is Advanced search test case