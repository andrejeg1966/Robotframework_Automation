*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/locators.py

*** Keywords ***
click PyPal
    click link      ${link_PayPal}
verify paypal page title
    title should be     PayPal Commerce (the official integration) - nopCommerce