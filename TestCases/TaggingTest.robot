

*** Test Cases ***
TC1 user registration test
    [Tags]         regression
    log to console  this is user registration test
    log to console  user registration test is over
TC2 login test
#to execute only sanity tests execute command in terminal: robot --include=sanity <Directory/Testcase.robot>
    [Tags]         sanity
    log to console  this is login test
    log to console  login test is over
TC3 change user settings test
#to execute only sanity tests execute command in terminal: robot --include=regression <Directory/Testcase.robot>
    [Tags]         regression
    log to console  this is change user test
    log to console  change user test is over
TC4 logout test
    [Tags]         sanity
    log to console  this is logout test
    log to console  logout test is over

#other option to execute test *** test cases ***
robot -i sanity -i regression <Directory/Testcase.robot>
robot -e regression <Directory/Testcase.robot>
#i is shortcut for include
#e is shortcut for exclude