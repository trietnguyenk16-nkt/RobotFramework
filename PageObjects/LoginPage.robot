*** Settings ***
Documentation       Login Page
Library             SeleniumLibrary

*** Variables ***
${id_username}        id:username
${id_password}        id:password
${id_agree}           id:terms
${id_signin}          id:signInBtn
${xpath_text}         //div[@class='container']/a

*** Keywords ***
fill the login form
    [Arguments]     ${username}         ${password}
    Input Text   ${id_username}    ${username}
    Input Text   ${id_password}      ${password}
    Select Checkbox   ${id_agree}
    Click Button    ${id_signin}

Verify login successfully
    Wait Until Element Is Visible           ${xpath_text}          10
    Element Text Should Be   ${xpath_text}     ProtoCommerce Home       Sigin