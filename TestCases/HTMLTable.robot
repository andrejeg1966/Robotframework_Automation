*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Table Operation
    [Documentation]     Test Case to demonstrate how to capture data from HTML table
    open browser        https://testautomationpractice.blogspot.com/     chrome
    maximize browser window
                                    #select all rows in the table
    ${rows}=    get element count   xpath://table[@name="BookTable"]/tbody/tr
    #get columns                    #select all columns in the table (relation to first row)
    ${cols}=    get element count   xpath://table[@name="BookTable"]/tbody/tr[1]/th
    log to console  ${rows}
    log to console  ${cols}

    #capture some data
    ${data_Master_in_Selenium}=     get text    xpath://table[@name="BookTable"]/tbody/tr[5]/td[1]
    log to console  ${data_Master_in_Selenium}

    #Validation of table
                                     #table                              2. column
    table column should contain      xpath://table[@name="BookTable"]    2               Author
                                     #                                   4. row
    table row should contain         xpath://table[@name="BookTable"]    4               Javascript
                                     #                                   5. row    2. column    Mukesh
    table cell should contain        xpath://table[@name="BookTable"]    5         2      Mukesh
    table header should contain      xpath://table[@name="BookTable"]    BookName
    close browser



