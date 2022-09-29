*** Settings ***
Documentation       This TC is to test login failed scenario
Library     SeleniumLibrary
Resource    SetUpTC.robot
Task Setup     Open Browser And Navigate To Page
Test Template       Login With Invalid Credentials

*** Variables ***
${xpath_text}         //div[@class='container']/a
${id_username}        id:username
${id_password}        id:password
${id_agree}           id:terms
${id_signin}          id:signInBtn
${xpath_alert_failed}       xpath://form[@id='login-form']/div[contains(@class,'alert')]

*** Test Cases ***                              USER_NAME               PASSWORD
Invalid Username                                invalidUserName         learning
Invalid Password                                rahulshettyacademy      invalidPassword
Invalid Username And Password                   invalidUserName         invalidPassword

*** Keywords ***
Login With Invalid Credentials
    [Arguments]         ${user_name}            ${id_password}
    Input User Name   ${user_name}
    Input Password    ${id_password}
    Check Agree checkbox
    Sign In And Verify Sign In Failed
    Close All Browsers

Input User Name
    [Arguments]     ${user_name}
    Input Text    ${id_username}    ${user_name}

Input Password
    [Arguments]     ${password}
    Input Text    ${id_password}    ${password}

Check Agree checkbox
    Select Checkbox     ${id_agree}

Sign In And Verify Sign In Failed
    Click Button    ${id_signin}
    Wait Until Element Is Visible    ${xpath_alert_failed}        3
    ${attribute}=       Get Element Attribute    ${xpath_alert_failed}    style
    Should Contain      ${attribute}        block       Do not display alert message
    