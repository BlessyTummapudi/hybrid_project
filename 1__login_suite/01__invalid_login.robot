*** Settings ***
Documentation   This file contains invalid logins

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver  file=../test_data/project.xlsx      sheet_name=Invalidlogintest
Test Setup  Launch Browser And Navigate To Url
Task Teardown   Close Browser

Test Template   Invalid Login Template


*** Test Cases ***
TC1

*** Keywords ***
Invalid Login Template
    [Arguments]     ${email}   ${password}  ${error}
    Click Element     xpath=//span[text()='Hello, sign in']
    Input Text        name=email    ${email}
    Click Element    xpath=//input[@id='continue']
    Input Password    name=password    ${password}
    Click Element       xpath=//input[@id='signInSubmit']
    Element Should Contain      xpath=//h4[text()='There was a problem']    ${error}
