*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Test Xpath starts-with
    #Format xpath=//tagname[stars-with(@Attribute, 'Value')]
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      xpath://input[starts-with(@id, 'CompanyName')]             RCVAcademy  #second part of id is a dynamically
    close browser

Test Xpath contains
    #Format xpath=//tagname[contains(@Attribute, 'Value')]
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      xpath://input[contains(@name, 'rEmail')]                    RCVAcademy@RCVAcademy.com
    close browser

Test Xpath link text
     #Format xpath=//tagname[text()='Actualtext']
     open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
     maximize browser window
     click link      xpath: //a[text()='Privacy Statement']
     sleep           3
     close browser

Test Xpath AND OR
     #xpath=//tagname[@Attribute='Value' or @Attribute='Value']
     #xpath=//tagname[@Attribute='Value' and @Attribute='Value']
     open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
     maximize browser window
     input text      xpath://input[@type='text' and @name='UserFirstName']             RCVAcademy
     close browser

    #Parent, Child and self
     #//select[@name='CompanyCountry']//self::select
     #//select[@name='CompanyCountry']//parent::div
     #chose US from the country list
     #//select[@name='CompanyCountry']//child::option[2]
     #if the parent element don't have any attribute->start from child to parent
     #//option[@value='AS']//parent::select
Test Xpath select a child
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    click element   xpath://select[@name='CompanyCountry']//child::option[2]
    close browser
Test Xpath find parent from childe
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    click element   xpath://option[@value='AS']//parent::select
    close browser
Test Xpath descendants and (descendants or self)
    #Find successors
     #xpath=//tagname[@Attribute='Value']//descendant::tagname
     #xpath=//tagname[@Attribute='Value']//descendant-or-self::tagname
Test Xpath ancestor and (ancestor or self)
     #Find ancestors
     #xpath=//tagname[@Attribute='Value']//ancestor::tagname
     #xpath=//tagname[@Attribute='Value']//ancestor-or-self::tagname
Test Xpath following
     #Find all following nodes with the tagname
     #xpath=//tagname[@Attribute='Value']//following::tagname
     #//option[@value='AG']//following::option #selected 220 elements
     #//option[@value='VG']//following::option #selected 7 elements

Test Xpath following sibling
     #Find all following siblings
     #xpath=//tagname[@Attribute='Value']//following-sibling::tagname
     #//option[@value='AG']//following-sibling::option #selected 6 elements
     #//option[@value='VG']//following-sibling::option[@value='ZM'] #select specific following element

Test Xpath preceding
     #Find all nodes before with the tagname
     #xpath=//tagname[@Attribute='Value']//preceding::tagname
     #//option[@value='AG']//preceding::option #selected 10
Test Xpath preceding sibling
     #Find all sibling nodes before
     #xpath=//tagname[@Attribute='Value']//preceding-sibling::tagname
     #//option[@value='AG']//preceding-sibling::option #selected 10
     #//option[@value='AG']//preceding::option[@value='DZ']   ##select specific preceding element











