*** Settings ***
Documentation   API automation robot framework
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         String
Resource        variable.robot

*** Test Cases ***
Test Post Request with create Session
    [Tags]              tc1
    ${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
    ${body}             Create Dictionary    firstname=Pink    lastname=Panter    totalprice=200    depositpaid=False
    ...                 bookingdates=${booking_dates}   additionalneeds=Breakfast
    Create Session      POST     ${BASE_URL}     disable_warnings=1
    ${response}         POST On Session     POST    ${ENDPOINT}     json=${body}
    Status Should Be    200
    ${id}    Set Variable    ${response.json()}[bookingid]
    log to console     id:${id}
    Should Be Equal    ${response.json()}[booking][firstname]   Pink
    Should Be Equal    ${response.json()}[booking][lastname]    Panter
    Should Be Equal As Strings    ${response.json()}[booking][totalprice]    200
    Should Be Equal As Numbers   ${response.json()}[booking][totalprice]    200
    #Run Keyword If     ${response.json()}[booking][depositpaid]=='false'  Log depositpaid
    #Should Be Equal As Strings             ${response.json()}[booking][depositpaid]    true
    Should Be Equal    ${response.json()}[booking][bookingdates][checkin]    2022-12-31
    Should Be Equal    ${response.json()}[booking][bookingdates][checkout]    2023-01-01
    Should Be Equal    ${response.json()}[booking][additionalneeds]    Breakfast
    log to console     response:${response.json()}

Test Post Request without create Session
    [Tags]              tc2
    ${booking_dates}    Create Dictionary    checkin=2023-11-31    checkout=2024-02-01
    ${body}             Create Dictionary    firstname=Tigerx    lastname=Woodx    totalprice=300    depositpaid=False
    ...                 bookingdates=${booking_dates}   additionalneeds=Breakfast fool
    ${response}         POST    ${BASE_URL}${ENDPOINT}   json=${body}  expected_status=200
    log to console      response:${response.json()}

    #Verify booking Id
    ${get_response}    GET  ${BASE_URL}${ENDPOINT}/${response.json()}[bookingid]    expected_status=200
    Should Be Equal    ${get_response.json()}[firstname]   Tigerx
    Should Be Equal    ${get_response.json()}[lastname]    Woodx
    Should Be Equal As Numbers   ${get_response.json()}[totalprice]    300
    #Dictionary Should Contain Value     ${get_response}[booking][bookingdates]    2023-11-31
    #Dictionary Should Contain Value     ${body}    2024-02-01


*** Keywords ***
#Log depositpaid
    #log to console      depositpaid:${TRUE}
