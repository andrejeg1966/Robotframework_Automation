*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/POM_LoginKeywords.robot

*** Variables ***
${SiteUrl}      https://admin-demo.nopcommerce.com
${Browser}      chrome
${username}     admin@yourstore.com
${password}     admin

*** Test Cases ***
Login Test
    open my browser   ${SiteUrl}    ${Browser}
    enter username    ${username}
    enter password    ${password}
    click SigIn
    sleep   3
    verify succesfull login
    close my browser