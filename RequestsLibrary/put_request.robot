*** Settings ***
Documentation   API automation robot framework
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         String
Resource        variable.robot
Suite Setup    Authenticate as Admin


*** Test Cases ***
Sending Test Request
    Test Post Request
    Test Modify Request

*** Keywords ***
Test Post Request
    #[Tags]              tc1
    ${booking_dates}    Create Dictionary    checkin=2023-11-31    checkout=2024-02-01
    ${body}             Create Dictionary    firstname=Mad    lastname=Max    totalprice=300    depositpaid=false
    ...                 bookingdates=${booking_dates}   additionalneeds=Breakfast fool
    ${post_response}         POST    ${BASE_URL}${ENDPOINT}   json=${body}  expected_status=200
    log to console      post_response:${post_response.json()}
    Test Get Request To Verify    ${post_response.json()}[bookingid]
    ...     ${post_response.json()}[booking][firstname]
    ...     ${post_response.json()}[booking][lastname]
    ...     ${post_response.json()}[booking][totalprice]
    ...     ${post_response.json()}[booking][bookingdates][checkin]
    ...     ${post_response.json()}[booking][bookingdates][checkout]

Test Get Request To Verify
    #[Tags]              tc2
    [Arguments]     ${id}   ${fname}   ${lname}   ${tprice}     ${checkin}  ${checkout}
    ${get_response}    GET  ${BASE_URL}${ENDPOINT}/${id}    expected_status=200
    Set Suite Variable    ${id}
    log to console      get_response:${get_response.json()}
    Should Be Equal    ${get_response.json()}[firstname]   ${fname}
    Should Be Equal    ${get_response.json()}[lastname]   ${lname}
    Should Be Equal As Numbers    ${get_response.json()}[totalprice]   ${tprice}
    #Dictionary Should Contain Value     ${get_response.json()}[checkin]   ${checkin}
    #Dictionary Should Contain Value     ${get_response.json()}   ${bookingdates}

Test Modify Request
    ${booking_dates}    Create Dictionary    checkin=2${UPDATE_CHECKIN}    checkout=${UPDATE_CHECKOUT}
    ${body}             Create Dictionary    firstname=${UPDATE_FIRSTNAME}
    ...     lastname=${UPDATE_LASTTNAME}
    ...     totalprice=${UPDATE_TOTALPRICE}
    ...     depositpaid=${UPDATE_DEPOSIDPAID}
    ...     bookingdates=${booking_dates}
    ...     additionalneeds=${UPDATE_ADDS}
    ${header}    Create Dictionary    Cookie=token\=${token}
    ${put_response}         PUT    ${BASE_URL}${ENDPOINT}/${id}     headers=${header}   json=${body}  expected_status=200
    log to console      put_response:${put_response.json()}

Authenticate as Admin
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    ${BASE_URL}/auth    json=${body}     expected_status=200
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}
