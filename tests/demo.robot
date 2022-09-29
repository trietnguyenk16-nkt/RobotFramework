*** Settings ***
Documentation       To validate the login form
Library     SeleniumLibrary
Resource    SetUpTC.robot
Task Setup     Open Browser And Navigate To Page

*** Variables ***
${xpath_text}         //div[@class='container']/a
${id_username}        id:username
${id_password}        id:password
${id_agree}           id:terms
${id_signin}          id:signInBtn

*** Test Cases ***
Validate UnSuccessful Login
    fill the login form
    select type
    select privilege
    sign in and verify sign in successfully
    close browser

*** Keywords ***
fill the login form
    Input Text   ${id_username}    rahulshettyacademy
    Input Text   ${id_password}      learning
    Select Checkbox   ${id_agree}

select type
    Select From List By Value   //form[@id='login-form']//select   teach

select privilege
    Click Element    //label[input[@id='usertype'] and span[text()=' User']]/span[2]
    Wait Until Element Is Visible       id:okayBtn      3
    Click Button    id:okayBtn

sign in and verify sign in successfully
    Click Button    ${id_signin}
    Wait Until Element Is Visible           ${xpath_text}          3
    Element Text Should Be   ${xpath_text}     ProtoCommerce Home       Sigin Failed

close browser
    Close All Browsers