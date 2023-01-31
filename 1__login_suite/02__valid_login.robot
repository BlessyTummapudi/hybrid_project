*** Settings ***
Documentation   This file contains valid logins

Resource    ../resource/base/common_functionalities.resource


Library     DataDriver  file=../test_data/project.xlsx      sheet_name=Validlogintest
Test Setup  Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Valid Login Template


*** Test Cases ***
TC1

*** Keywords ***
Valid Login Template
    [Arguments]     ${email}   ${password}
    Click Element     xpath=//span[text()='Hello, sign in']
    Input Text        name=email    ${email}
    Click Element    xpath=//input[@id='continue']
    Input Password    name=password    ${password}
    Click Element       xpath=//input[@id='signInSubmit']
