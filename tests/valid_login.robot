*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             This test follows the exmaple using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # page should contain element 
    Login Should Be Successful
    