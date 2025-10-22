*** Settings ***
Library     SeleniumLibrary

*** Variables ***


*** Test Cases ***
Explicit wait test
    [Documentation]     Explicit wait is applicable only for those webelements which are specified by the user.
...                     Explixit wait requires expected condition like "Wait until elmenet is enabled"
