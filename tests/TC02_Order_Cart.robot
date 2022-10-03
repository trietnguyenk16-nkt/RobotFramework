*** Settings ***
Documentation       Add order to cart, checkout and verify
Resource    SetUpTC.robot
Library     SeleniumLibrary
Library    Collections
Task Setup     Open Browser And Navigate To Page


*** Variables ***
${xpath_text}         //div[@class='container']/a
${id_username}        id:username
${id_password}        id:password
${id_agree}           id:terms
${id_signin}          id:signInBtn
${xpath_list_product_to_cart}    //h4[@class='card-title']/a
${xpath_list_product_cart_page}         //h4[@class='media-heading']/a
@{list_product}                     iphone X        Samsung Note 8

*** Test Cases ***
Order Cart
    fill the login form
    Verify login successfully
    Add IphoneX and Samsung Note8 to cart
    Go to Checkout page
    Check the products in cart
    #Check the total price
    Click Checkout button to purchase
    Purchase item
    Verify purchase item successfully
    Close All Browsers

*** Keywords ***
fill the login form
    Input Text   ${id_username}    rahulshettyacademy
    Input Text   ${id_password}      learning
    Select Checkbox   ${id_agree}
    Click Button    ${id_signin}

Verify login successfully
    Wait Until Element Is Visible           ${xpath_text}          10
    Element Text Should Be   ${xpath_text}     ProtoCommerce Home       Sigin

Add IphoneX and Samsung Note8 to cart
    Wait Until Element Is Visible           ${xpath_list_product_to_cart}          10
    @{list_proudct_webelements}=   Get WebElements    ${xpath_list_product_to_cart}
    FOR   ${product_webelement}   IN    @{list_proudct_webelements}
        ${product}=     Get Text    ${product_webelement}
        #Way1: Hard code iphone X and Samsung Note 8
#        IF    '${product}' == 'iphone X' or '${product}' == 'Samsung Note 8'
#                ${index}=    Get Index From List   ${list_proudct_webelements}   ${product_webelement}
#                ${index}=       Set Variable    ${index + 1}
#                Click Button    (//div[@class='card-footer']/button)[${index}]
#        END
        ${index}=       Set Variable        0

        #Way 2: Use IF
        IF      '${product}' in ${list_product}
            ${index}=    Get Index From List   ${list_proudct_webelements}   ${product_webelement}
            ${index}=       Set Variable    ${index + 1}
            Click Button    (//div[@class='card-footer']/button)[${index}]
        END

    END

Go to Checkout page
    Scroll Element Into View        //a[contains(text(),'Checkout')]
    Click Element        //a[contains(text(),'Checkout')]

Check the products in cart
         #Way 1
#        Wait Until Element Is Visible    ${xpath_list_product_cart_page}   10
#        @{list_product_webelement}=     Get WebElements    ${xpath_list_product_cart_page}
#        ${result}=      Set Variable       True
#        FOR     ${product_webelement}      IN      @{list_product_webelement}
#            ${product}=     Get Text    ${product_webelement}
#            IF   '${product}' == 'iphone X' or '${product}' == 'Samsung Note 8'
#                ${result}=      Set Variable    ${result} and True
#            ELSE
#                 ${result}=      Set Variable    ${result} and False
#            END
#        END
#
#        Should Be True    ${result}

         #Way 2

    @{list_product_webelement}=     Get WebElements    ${xpath_list_product_cart_page}
    @{list_product_actual}=      Create List
    FOR     ${product_webelement}      IN      @{list_product_webelement}
        ${product}=     Get Text    ${product_webelement}
        Append To List      ${list_product_actual}      ${product}
    END
    Log        ${list_product_actual}
    Lists Should Be Equal           ${list_product}         ${list_product_actual}          List products in cart are not correct

Click Checkout button to purchase
    Click Button            //button[contains(text(),'Checkout')]

Purchase item
    Wait Until Element Is Visible    //input[@id='country']     10
    Input Text    //input[@id='country']    India
    Wait Until Element Is Visible       //a[text()='India']     10
    Click Element    //a[text()='India']
    Click Element    //label[@for='checkbox2']
    Click Element    //input[@value='Purchase']

Verify purchase item successfully
    Wait until Element Is Visible      //div[contains(@class,'alert-success')]         10


#IN-PROGRESS
#Check the products in cart - try to use compare list - DONE
#Try to create a list of product first then add to cart and compare - Create a list in variable instead of using Iphone X or Samsung in Keyword - DONE
#Some keywords can go to function (create a page and put all related keywords in that page), such as: fill the login form   - INPROGRESS (CREATE ROBOT FRAMEWORK PAGE)
#Practice Robot Framework with #'Check the total price' keyword
#Create custom keywords and in the custom keywords, use python code then in the robot framework file, call that custom keywords - INPROGRESS (CUSTOM KEYWORDS WITH PYTHON SELENIUM)
#Try to find a way to commit all of the code to git, github - DONE
#Try to find a way to use jenkins and build and run the robot framework code
#Try to use tags (regression, sanity,...) - DONE
#Try to use pabot (to run the TCs in parallel)
#Try with TC that handle switch browser
#Try with TC has Cookie like digital-easy.link  - DONE
#Learn more robotframework from this youtube channel SDET- QA Automation