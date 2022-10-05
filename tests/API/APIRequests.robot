*** Settings ***
Documentation   API
Library               RequestsLibrary
Library     Collections
Library    Dialogs
#     pip install robotframework-requests


*** Variables ***
${BaseUrl}      https://reqres.in/

*** Test Cases ***
Create Users
    &{data}=    Create Dictionary       name=morpheus       job=leader
    ${response}=    POST        ${BaseUrl}      json=${data}        expected_status=201
    Log     ${response.json()}