*** Settings ***
Documentation       Set up
Library     SeleniumLibrary

*** Variables ***
${url}                https://www.rahulshettyacademy.com/loginpagePractise/
${browser}            chrome
${executable_path}    D:\\LearningAndProjects\\RobotFramework\\SeleniumDrivers\\chromedriver.exe

*** Keywords ***
Open Browser And Navigate To Page
    [Arguments]         ${url}=${url}     ${browser}=${browser}     ${executable_path}=${executable_path}
    Open Browser   ${url}    ${browser}        executable_path=${executable_path}
    Maximize Browser Window