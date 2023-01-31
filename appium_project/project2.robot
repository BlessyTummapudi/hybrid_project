*** Settings ***
Library  AppiumLibrary

*** Test Cases ***
TC1
    &{dic}  Create Dictionary   buildName=project
    ...     projectName=project
    ...     userName=blessyt_KEbyiC
    ...     accessKey=qTznLFsYy99t87JDSXpw


   Open Application     remote_url=http://hub.browserstack.com/wd/hub
    ...     platformName=android
    ...     deviceName=Google Pixel 3
    ...     app=bs://589d47f1f24a14706fdd08ee743d873cdf3580d4
    ...      platformVersion=9.0
    ...    bstack:options=${dic}
    Set Appium Timeout    50s


    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id='com.phonegap.rxpal:id/tv_next']
    Click Element    xpath=//android.widget.TextView[@resource-id='com.phonegap.rxpal:id/tv_next']

    Wait Until Page Contains Element    xpath=//android.widget.FrameLayout[@resource-id='com.phonegap.rxpal:id/navigation_healthcare']
    Click Element    xpath=//android.widget.FrameLayout[@resource-id='com.phonegap.rxpal:id/navigation_healthcare']

    ${count}  Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Hair Care']
    WHILE    ${count}==0
        Swipe By Percent    90  55    90    35
         ${count}    Get Matching Xpath Count    xpath=//android.widget.TextView[@text='Hair Care']
    END
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Hair Care']
    Click Element    xpath=//android.widget.TextView[@text='Hair Care']

    Wait Until Page Contains Element   xpath=//android.widget.ImageView[@resource-id='com.phonegap.rxpal:id/iv_top_category']
    Click Element    xpath=//android.widget.ImageView[@resource-id='com.phonegap.rxpal:id/iv_top_category']

    Wait Until Page Contains Element    xpath=//android.widget.ImageView[@resource-id='com.phonegap.rxpal:id/iv_product']
    Click Element    xpath=//android.widget.ImageView[@resource-id='com.phonegap.rxpal:id/iv_product']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Add To Cart']      timeout=105s
    Click Element    xpath=//android.widget.TextView[@text='Add To Cart']
    Click Element    xpath=//android.widget.RelativeLayout[@resource-id='com.phonegap.rxpal:id/row_quantity'][2]
    Click Element    xpath=//android.widget.TextView[@text='View Cart']

    Click Element    xpath=//android.widget.TextView[@text='Add Delivery Address']
    Click Element    xpath=//android.widget.TextView[@text='Send OTP']
    Element Should Contain Text    xpath=//android.widget.TextView[@resource-id='com.phonegap.rxpal:id/tv_error']    Enter a 10 digit number


    Sleep    5s
    [Teardown]      Close Application
