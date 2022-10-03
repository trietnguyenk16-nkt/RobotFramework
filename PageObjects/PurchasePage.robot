*** Settings ***
Documentation       Purchase Page
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${xpath_list_product_cart_page}         //h4[@class='media-heading']/a

*** Keywords ***
Purchase item
    [Arguments]     ${country}
    Wait Until Element Is Visible    //input[@id='country']     10
    Input Text    //input[@id='country']    India
    Wait Until Element Is Visible       //a[text()='${country}']     10
    Click Element    //a[text()='${country}']
    Click Element    //label[@for='checkbox2']
    Click Element    //input[@value='Purchase']

Verify purchase item successfully
    Wait until Element Is Visible      //div[contains(@class,'alert-success')]         10
