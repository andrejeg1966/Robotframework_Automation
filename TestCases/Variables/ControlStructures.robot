*** Test Cases ***

*** Variables ***
${rc}=      1
${five}=    5
${last}=    ten
&{EMPLOYERS}    name=john    id=12


*** Test Cases ***
Example IF ELSE
    IF    ${rc} > 0
        Positive keyword
    ELSE IF    ${rc} < 0
        Negative keyword
    ELSE IF    ${rc} == 0
        Zero keyword
    ELSE
        Fail    Unexpected rc: ${rc}
    END

Example
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop

Second Example
    FOR    ${var}    IN    one    two    ${3}    four    ${five}
    ...    kuusi    7    eight    nine    ${last}
        Log    ${var}
    END

Multiple nesting levels
    FOR    ${root}    IN    r1    r2
        FOR    ${child}    IN    c1   c2    c3
            FOR    ${grandchild}    IN    g1    g2
                Log Many    ${root}    ${child}    ${grandchild}
            END
        END
        FOR    ${sibling}    IN    s1    s2    s3
            IF    '${sibling}' != 's2'
                Log Many    ${root}    ${sibling}
            END
        END
    END

Multiple loop variables
    FOR    ${index}    ${english}    ${finnish}    IN
    ...    1           cat           kissa
    ...    2           dog           koira
    ...    3           horse         hevonen
        log many        ${english}    ${finnish}    ${index}
        Add Translation    ${english}    ${finnish}    ${index}
    END
    FOR    ${name}    ${id}    IN    @{EMPLOYERS}
        Create    ${name}    ${id}
    END
*** Keywords ***
Positive keyword
    log to console    this is positive keyword
Negative keyword
    log to console    this is negative keyword
Zero keyword
    log to console    this is Zero keyword
Add Translation
    [Arguments]    ${english}    ${finnish}    ${index}
    ${dynamic variable}            Catenate                   SEPARATOR=${SPACE}    ${english}      ${finnish}    ${index}
    log to console    dynamic variable:${dynamic variable}
    log               ${dynamic variable}
Create
    [Arguments]     ${name}    ${id}
    ${dynamic variable}            Catenate                   SEPARATOR=${SPACE}    ${name}      ${id}
    log to console    dynamic variable:${dynamic variable}
    log many          ${name}    ${id}