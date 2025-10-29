*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
GetAllLinksText
    open browser    https://demo.nopcommerce.com/   chrome
    Maximize Browser Window
    ${AllLinksText}=    getelement count    xpath://a
    log to console      ${AllLinksText}
    FOR     ${item}     IN  RANGE   1  ${AllLinksText}+1
        ${linkText}=    get text    xpath:(//a)[${item}]
        log to console   ${linkText}
    END
