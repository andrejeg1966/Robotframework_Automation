*** Variables ***
@{list}     item1 item2 item3
@{listInt}     1 2 3 4 5 6
@{listExitFor}     foo foo foo foo bar foo

*** Test Cases ***
ForLoopDemo1
    FOR   ${i}    IN RANGE    10
    log to console     ${i}
    END

ForLoopDemo2
    FOR     ${item}     IN  @{list}
    log to console      ${item}
    # Perform other actions on ${item}
    END

ForLoopDemo3
    FOR     ${item}     IN  1 2 3 4 5
    log to console      ${item}
    # Perform other actions on ${item}
    END

ForLoopDemo4
    FOR     ${item}     IN  john smith  scot
    log to console      ${item}
    # Perform other actions on ${item}
    END

ForLoopWithExit1
    FOR     ${var1}     IN  @{listInt}
        log to console      ${var1}
        Exit For Loop If    '${var1}' == '3'
    END

ForLoopWithExit2
    FOR    ${item}    IN    @{listExitFor}
        ${result}=    Run Keyword And Return Status    Should Be Equal    ${item}    foo
        Continue For Loop If    ${result}
        log to console    ${item}
        Exit For Loop If    '${item}' == 'bar'
        log to console    ${item}
    END



