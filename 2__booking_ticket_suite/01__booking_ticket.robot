*** Settings ***
Documentation   This file contains booking flights

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
    Click Element    xpath=//span[text()='Flights']
    Click Element    xpath=//button[text()='Search']
    Click Element    xpath=//button[text()='Book']
    Click Element    link=Proceed to traveller details
    Click Element   xpath=//div[text()='Add new adult']
    Click Element    xpath=//button[text()='Select']
    Click Element    xpath=//li[text()='Ms']
    Input Text     id=input-firstName       blessy
    Input Text    name=lastName    T
    Click Element    xpath=//button[text()='Add adult']
    Click Element    xpath=//i[@class='d726bd8f _4d2636f0']
     Input Text    name=communication_email      blessy.tummapudi@gmail.com
    Click Element    xpath=//button[normalize-space()='Proceed to review'] 
    Click Element    xpath=//i[@class='d726bd8f _4d2636f0']
    Click Element    xpath=//button[normalize-space()='Proceed to Payment']
    Click Element    xpath=//input[@name='ppw-instrumentRowSelection']
    Click Element    xpath=//input[@name='ppw-widgetEvent:AddCreditCardEvent']
    Element Should Contain    xpath=//h4[text()='There was a problem.']    There was a problem.
   



