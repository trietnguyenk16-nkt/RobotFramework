*** Settings ***
Documentation       Demo Custom Keywords
Library         CustomKeywords/CustomKeywordsDemo.py

*** Test Cases ***
Show Log 1
    [Tags]      Sanity
    Add Product To Cart
    ${sum}=     Take Argument Then Return    2    3
    Log         ${sum}

Show Log 2
    [Tags]      Sanity
    Add Product To Cart
    ${sum}=     Take Argument Then Return    4    5
    Log         ${sum}

Show Log 3
    [Tags]      Sanity
    Add Product To Cart
    ${sum}=     Take Argument Then Return    5    6
    Log         ${sum}

Show Log 4
    [Tags]      Regression
    Add Product To Cart
    ${sum}=     Take Argument Then Return    6    7
    Log         ${sum}