*** Settings ***
Documentation       Add To Cart Page
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${xpath_list_product_to_cart}    //h4[@class='card-title']/a

*** Keywords ***
Add Items to Cart
    [Arguments]                 ${list_product}
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