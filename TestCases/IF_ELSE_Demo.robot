*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://www.saucedemo.com/
${browser}  chrome
${color} =  set variable  Blue
${Size} =  set variable  Small
${Simple} =  set variable  Simple
${Design} =  set variable  Simple
${rc}         0.0

*** Test Cases ***
Test Case to demonstrate IF ELSE in Robot Framwwork
    [Documentation]     Test Case to demonstrate IF ELSE in Robot Framwwork
    open browser    ${url}  ${browser}
    maximize browser window
    input text      id:user-name   standard_user
    input text      id:password    secret_sauce
    click button    //input[@id='login-button']
    ${items_on_page}    Get element count   xpath://*[@class="inventory_list"]/div
    log     items_on_page:${items_on_page}

    Run Keyword If  ${items_on_page} == 10  Test Keyword 1
...     ELSE IF     ${items_on_page} < 10 and ${items_on_page} > 5    Test Keyword 2
...     ELSE  Test Keyword 3

 mytest
    ${color} =  set variable  Red
    Run Keyword If  '${color}' == 'Red'  log to console  \nexecuted with single condition
    Run Keyword If  '${color}' == 'Red' or '${color}' == 'Blue' or '${color}' == 'Pink'  log to console  \nexecuted with multiple or
    Run Keyword If  '${color}' == 'Blue' and '${Size}' == 'Small' and '${Design}' != '${Simple}'  log to console  \nexecuted with multiple and

 Nested IF Keyword
    [Documentation]     Test Case to demonstrate nested IF in Robot Framwwork
    My Nested Keyword

*** Keywords ***
Test Keyword 1
    Log to console  \executed Keyword 1 - found items as expected
    close browser
Test Keyword 2
    Log to console  \executed Keyword 2 - found less than expected items
    close browser
Test Keyword 3
    Log to console  \executed Keyword 3 - exception
    close browser

My Nested Keyword
     FOR    ${i}    IN RANGE    10
            IF    $i % 2
                IF   $i > 5
                    Log    Odd number over 5: ${i}
                END
            END
     END