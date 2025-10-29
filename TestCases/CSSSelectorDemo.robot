*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Test CSS Selector with Id and Name Attribute
    #Syntax: tagname[AttributeName='AttributeValue']
    #Syntax: or by ID: tagnname#elementID
    #Id attribute in CSS Selector is symbolized by hash (#) sign
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input#UserLastName-e8qL                  RCVAcademy@RCVAcademy.com
    #input text      css:input[name='UserLastName']          RCVAcademy@RCVAcademy.com
    input text      css:input[name='UserFirstName']         RCVAcademy
    sleep           2s
    close browser
Test CSS Selector with Class Attribute
    #Syntax: tagname.ClassName
    #Class attribute in CSS Selector is symbolized by dot (.) sign
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    Click Element        css:class.submit btn btn-lg btn-primary salesforce-sans-regular  btn-full
    sleep           2s
    close browser
Test CSS Selector mix ID name   class
    #syntax: tagName.classValue[AttributeName='AttributeValue']  or tagName.classValue[AttributeName1='AttributeValue1'][AttributeName2='AttributeValue2']kombi class with other attribute
    #syntax: tagName#idValue[AttributeName='AttributeValue'] or tagName#idValue[AttributeNam1='AttributeValu1']  tagName#idValue[AttributeNam1='AttributeValu1'] kombi class with other attribute
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input#UserEmail-e8qL[type='email'][name='UserEmail']    RCVAcademy
    sleep           2s
    close browser

Test CSS Selector prefix string
    #for dynamic webelements
    #'^' Sign - Signify's the prefix of the text
    #'$' Sign - Signify's the suffix of the text
    #'*' Sign - Signify's the sub-string of the text
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input[name^='UserE']                abc
    sleep           2s
    close browser
Test CSS Selector suffix string
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input[name$='Email']                abc
    sleep           2s
    close browser
Test CSS Selector substring string
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input[name*='erEm']                abc
    sleep           2s
    close browser
Test CSS Selector ID substring string
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input[id*='erEm']                abc
    sleep           2s
    close browser

Test CSS Selector ID short substring string
    open browser    https://www.salesforce.com/form/developer-signup/?d=pb      chrome
    maximize browser window
    input text      css:input#*=erEm                    abc
    sleep           2s
    close browser

Test CSS Selector direct child
    #syntax: tagName[AttributeName='AttributeValue'] > tagName[AttributeName='AttributeValue']
    #Example select#CompanyCountry-KVFN>option[value='AL']

Test CSS Selector subchild
    #Select the child and all Descendent subchild. Sign is space
    #syntax: tagName[AttributeName='AttributeValue']  tagName[AttributeName='AttributeValue']
    #Example div[class='columnContainer parbase section'] div

Test CSS Selector sibling
    #Select the sibling. Sign is (+)
    #syntax: tagName[AttributeName='AttributeValue'] + tagName[AttributeName='AttributeValue']
    #Example option[value='AI']+option[value='BE']
Test CSS Selector first child
    #syntax: tagName[AttributeName='AttributeValue']>:first-child
    #Example: select#CompanyCountry-40cs>:first-child
Test CSS Selector last child
    #syntax: tagName[AttributeName='AttributeValue']>:last-child
    #Example: select[id='CompanyCountry-40cs']>:last-child
    #Example: select#CompanyCountry-40cs>:last-child
Test CSS Selector nth child
    #starts from top
    #syntax: tagName[AttributeName='AttributeValue']>:nth-child(n)
    #Example: select#CompanyCountry-40cs>:nth-child(3)
Test CSS Selector nth child
    #starts from botom
    #syntax: tagName[AttributeName='AttributeValue']>:nth-last-child(n)
    #Example: select#CompanyCountry-40cs>:nth-last-child(3)

    form#signup_form_Ymzf>input:first-of-type
    form#signup_form_Ymzf>input:last-of-type
    form#signup_form_Ymzf>input:nth-of-type(4)
