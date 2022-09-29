*** Settings ***
Documentation       This TC is to test login failed scenario
Library     SeleniumLibrary
Resource    SetUpTC.robot
Task Setup     Open Browser And Navigate To Page
Library        DataDriver       file=Resources/data_credentials.xlsx         sheet_name=data_credentials         encoding=utf_8
Test Template       Login With Invalid Credentials

*** Variables ***
${xpath_text}         //div[@class='container']/a
${id_username}        id:username
${id_password}        id:password
${id_agree}           id:terms
${id_signin}          id:signInBtn
${xpath_alert_failed}       xpath://form[@id='login-form']/div[contains(@class,'alert')]

*** Test Cases ***
Login With Credentials ${user_name} and ${password}        dfusername       dfpassword

*** Keywords ***
Login With Invalid Credentials
    [Arguments]         ${user_name}           ${password}
    Input User Name     ${user_name}
    Input Password      ${password}
    Check Agree checkbox
    Sign In And Verify Sign In Failed
    Close All Browsers

Input User Name
    [Arguments]     ${user_name}
    Input Text      ${id_username}        ${user_name}

Input Password
    [Arguments]     ${password}
    Input Text      ${id_password}      ${password}

Check Agree checkbox
    Select Checkbox     ${id_agree}

Sign In And Verify Sign In Failed
    Click Button    ${id_signin}
    Wait Until Element Is Visible    ${xpath_alert_failed}        3
    ${attribute}=       Get Element Attribute    ${xpath_alert_failed}    style
    Should Contain      ${attribute}        block       Do not display alert message
    