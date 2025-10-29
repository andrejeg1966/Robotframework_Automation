*** Settings ***
Library     OperatingSystem
Library     String
Library     SeleniumLibrary

*** Variables ***
${SEARCH}=     //input[@id='uh-sbq' or @name='q']
${BUTTON}=     //button[@aria-label='Im Web suchen'] or //input[@name='btnK']  #doesn't work
#${GOOGLE_SEARCH}=    name:q
#${GOOGLE_BUTTON}=    xpath://div[@class='FPdoLc lJ9FBc']//input[@name='btnK']

*** Test Cases ***
Get csv
    Read csv   ${SEARCH}   ${BUTTON}


*** Keywords ***
Read csv
    [Arguments]        ${locators}    ${button_locator}
    ${csv_content}      Get File    ./TestData/read_csv_file.csv
    @{read_into_list}   Create List     ${csv_content}
    FOR     ${line}     IN   @{read_into_list}
        log to console  \n${line}
    END

    ${lines}    Split to Lines   @{read_into_list}  1
    FOR     ${line}     IN   @{lines}
        @{split}    Split String    ${line}     ;
        ${first_item_line}    Set Variable        ${split}[0]
        log to console  \n${first_item_line}
        ${second_item_line}   Set Variable        ${split}[1]
        log to console  \n${second_item_line}
        #log to console  \n${split}
        Launch Browser      ${first_item_line}   ${locators}     ${second_item_line}    ${button_locator}
        close browser
    END

Launch Browser
    [Arguments]     ${first_line}   ${locators}     ${second_line}      ${button_locator}
    open browser    ${first_line}   chrome
    sleep           5s
    input text      ${locators}     ${second_line}
    click element   ${button_locator}


