*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/POM_DashboardKeywords.robot
Resource   ../Resources/POM_LoginKeywords.robot

*** Variables ***
${SiteUrl}      https://admin-demo.nopcommerce.com
${Browser}      chrome
${username}     admin@yourstore.com
${password}     admin

*** Test Cases ***
Dashboard Test
    open my browser   ${SiteUrl}    ${Browser}
    enter username    ${username}
    enter password    ${password}
    click SigIn
    click PyPal
    ${title}=   get title
    log to console      ${title}
    verify paypal page title
    close all browsers