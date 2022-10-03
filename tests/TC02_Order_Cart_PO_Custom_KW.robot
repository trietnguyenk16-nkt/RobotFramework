*** Settings ***
Documentation       Add order to cart, checkout and verify
Resource    SetUpTC.robot
Library     SeleniumLibrary
Library    Collections
Task Setup     Open Browser And Navigate To Page
Resource        ../PageObjects/LoginPage.robot
Resource        ../PageObjects/AddToCartPage.robot
Resource        ../PageObjects/CartPage.robot
Resource        ../PageObjects/PurchasePage.robot

*** Variables ***
${id_username}        id:username
${id_password}        id:password
${id_agree}           id:terms
${id_signin}          id:signInBtn
@{list_product}                     iphone X        Samsung Note 8
${country}              India

*** Test Cases ***
Order Cart
    LoginPage.fill the login form   rahulshettyacademy      learning
    LoginPage.Verify login successfully
    AddToCartPage.Add Items to Cart     ${list_product}
    AddToCartPage.Go to Checkout page
    CartPage.Check the products in cart     ${list_product}
    #Check the total price
    CartPage.Click Checkout button to purchase
    PurchasePage.Purchase item  ${country}
    PurchasePage.Verify purchase item successfully
    Close All Browsers

*** Keywords ***

#IN-PROGRESS
#Check the products in cart - try to use compare list - DONE
#Try to create a list of product first then add to cart and compare - Create a list in variable instead of using Iphone X or Samsung in Keyword - DONE
#Some keywords can go to function (create a page and put all related keywords in that page), such as: fill the login form   - DONE
#Practice Robot Framework with #'Check the total price' keyword
#Create custom keywords and in the custom keywords, use python code then in the robot framework file, call that custom keywords - INPROGRESS (CUSTOM KEYWORDS WITH PYTHON SELENIUM)
#Try to find a way to commit all of the code to git, github - DONE
#Try to find a way to use jenkins and build and run the robot framework code
#Try to use tags (regression, sanity,...) - DONE
#Try to use pabot (to run the TCs in parallel)
#Try with TC that handle switch browser
#Try with TC has Cookie like digital-easy.link  - DONE
#Learn more robotframework from this youtube channel SDET- QA Automation