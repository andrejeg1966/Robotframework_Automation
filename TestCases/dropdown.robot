*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url_dropdown}  https://www.selenium.dev/selenium/web/web-form.html
${url_list}  https://www.selenium.dev/selenium/web/iframes.html

*** Test Cases ***
Handling dropdown
    Open Browser    ${url_dropdown}  ${browser}
    Maximize Browser Window
    set selenium speed  1seconds
    select from list by label       my-select  Two
    sleep   5
    select from list by index       my-select  3
    close browser

Hadling list
    Open Browser    ${url_list}  ${browser}
    Maximize Browser Window
    set selenium speed  1seconds
    select from list by label      xpath://option[@value='ham']  Ham
    sleep 5
    #select from list by label      multi  Eggs
    close browser
