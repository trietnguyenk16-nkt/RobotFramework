*** Settings ***
Documentation       Cart Page
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${xpath_list_product_cart_page}         //h4[@class='media-heading']/a

*** Keywords ***
Check the products in cart
         [Arguments]            ${list_product}
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