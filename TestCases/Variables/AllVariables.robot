*** Settings ***
Library      SeleniumLibrary
Variables    PythonVariables.py

*** Variables ***
${my_var}     my_value
@{my_list}    Apple    Banana    Orange
&{my_dict}    name=goran    password=andrejevic     id=12


*** Test Cases ***
Test Case 1
    Log    ${my_var}
    Log    ${my_list}
    Log    ${my_dict}
    Log    ${my_dict}[name]
    Log    ${my_dict}[password]
    Log Many    @{my_list}   # Pass: Logs the items of the list object
    Log Many    ${my_list}   # Pass: Logs the whole list object
    #Log List    ${my_list}   # Pass: Logs the whole list object
    Log    ${my_list}[0]    # Pass: Logs the first item of the list object
    Log    ${my_list}[1]    # Pass: Logs the first item of the list object
    Log    ${my_list}[2]    # Pass: Logs the first item of the list object
    #Log    @{my_list}[0]    # Fail: @{my_list} is not a list object and does not have an index
    #Log    @{my_list}       # Fail: The second argument of the Log keyword `level` only allows the values `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `NONE`.
                            # The value `Banana` for the argument `level` is not allowed.
    FOR    ${item}    IN    @{my_list}  # Pass: Iterates over the items of the list object
        Log    ${item}                  # Pass: Logs the items of the list object
    END
    FOR   ${key}    ${value}    IN    &{my_dict}
        Log Many    ${key}    ${value}
    END

Test Case 2
    ${my_local_var}    Set Variable    Hello World
    Log    ${my_local_var}    # Pass: Logs the value of the variable
    Set Suite Variable    ${my_suite_var}    I'm a suite variable
    Set Global Variable    ${my_global_var}    I'm a global variable

Test Case 3
    #Log    ${my_local_var}    # Fails: Variable only exists in the scope of Test Case 1
    Log    ${my_suite_var}    # Pass: Variable exists for the scope of the whole suite
    Log    ${my_global_var}   # Pass: Variable exists for the scope of the whole test run

Test Case 4
    My Keyword
    #Log    ${my_keyword_var}    # Fails: Variable only exists in the scope of My Keyword
    Log    ${my_test_var}       # Pass: Variable  exists in the scope of the test case
Test Case 5
    Keyword With Static Variables   myArgument

Test Case Dictionary For Loop
    FOR    ${key}    IN    @{my_dict.keys()}
        Log to console     The current key is: ${key}
        Log to console     The value is: ${my_dict["${key}"]}
    END

    FOR    ${key}    ${value}    IN    &{my_dict}
        Log To Console   key = ${key}, value = ${value}
    END
Test Case Tabs
    FOR    ${main_key}    ${main_value}    IN    &{tabs}
        Log    ${main_key}
        FOR    ${sub_key}    ${sub_value}    IN    &{main_value}
            Log    ${sub_key}
            Log    ${sub_value}
        END
    END
*** Keywords ***
My Keyword
    ${my_keyword_var}    Set Variable    Hello Keyword
    Log    ${my_keyword_var}    # Pass: Logs the value of the variable
    Set Test Variable    ${my_test_var}    I'm a test case variable
    Log Many    ${my_var}    ${my_list}    ${my_dict}
Keyword With Static Variables
    [Arguments]    ${argument}
    ${static variable}             Set Variable               This is a static variable.
    log to console                 static variable:${static variable}
    Set Local Variable             ${other static variable}   Another way to set a static variable.
    log to console                 other static variable:${other static variable}
    ${dynamic variable}            Catenate                   SEPARATOR=${SPACE}    ${static variable}      ${other static variable}    ${argument}
    log to console                 dynamic variable:${dynamic variable}
    ${another dynamic variable}    Evaluate                   ${static variable}.upper()
    log to console                 another dynamic variable:${another dynamic variable}
    Should Not Be Equal            ${static variable}         ${other static variable}
