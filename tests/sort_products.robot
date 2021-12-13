*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             This test follows the exmaple using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

# Clicking select dropdown
# https://stackoverflow.com/questions/46476894/robot-framework-selecting-value-from-a-dropdown-list-which-appears-after-mouse

*** Test Cases ***
Sorted (A-Z)
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # page should contain element 
    Login Should Be Successful

    # click select dropdown
    Click Element       ${SELECT FILTER}

    # select a-z
    Click Element  ${OPTION A-Z}

    # assert if sorted (A-Z)
    Element Attribute Value Should Be     ${SELECT FILTER}      value   az

Sorted (Z-A)
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # page should contain element 
    Login Should Be Successful

    # click select dropdown
    Click Element       ${SELECT FILTER}

    # select a-z
    Click Element  ${OPTION Z-A}

    # assert if sorted (A-Z)
    Element Attribute Value Should Be     ${SELECT FILTER}      value   za

Sorted (Low-High)
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # page should contain element 
    Login Should Be Successful

    # click select dropdown
    Click Element       ${SELECT FILTER}

    # select lohi
    Click Element  ${OPTION LOHI}

    # assert if sorted (A-Z)
    Element Attribute Value Should Be     ${SELECT FILTER}      value   lohi


Sorted (High-Low)
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # page should contain element 
    Login Should Be Successful

    # click select dropdown
    Click Element       ${SELECT FILTER}

    # select hilo
    Click Element  ${OPTION HILO}

    # assert if sorted (A-Z)
    Element Attribute Value Should Be     ${SELECT FILTER}      value   hilo
