*** Settings ***
Documentation   API automation robot framework
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         String
Resource        variable.robot


*** Test Cases ***
Get All Ids
    Create Session  SESSION     ${BASE_URL}     disable_warnings=1
    ${response}    GET On Session   SESSION     ${ENDPOINT}
    Status Should Be    200
    Log     ${response.content}
    Log to console    ${response.content}

Get Bookin Id
    [Tags]  tc1
    Create Session  SESSION     ${BASE_URL}     disable_warnings=1
    ${response}    GET On Session   SESSION     ${ENDPOINT}/412
    Status Should Be    200
    Log     ${response.content}
    Log to console    content:${response.content}
    ${convert}      Convert String To Json   ${response.content}
    log to console    json:${convert}
    ${value}        Get Value from Json     ${convert}      $.lastname
    log to console    json value:${value}
    ${string}         Convert to string         ${value}
    ${final_value}    Remove String Using Regexp    ${string}    ['\\[\\]]
    log to console    final_value:${final_value}

Get Bookin Id whitout session
    [Tags]  tc2
    ${response}    GET  ${BASE_URL}${ENDPOINT}/412     expected_status=200
    log to console    response:${response}
    log to console    totalprice:${response.json()}[totalprice]
    log to console    checkin:${response.json()}[bookingdates][checkin]
    log to console    checkout:${response.json()}[bookingdates][checkout]
*** Keywords ***

