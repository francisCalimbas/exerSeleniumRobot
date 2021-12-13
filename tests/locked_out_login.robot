*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             This test follows the exmaple using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Locked Out Login
    Open Browser To Login Page
    # input username
    Input Username  ${LOCKED OUT USER}
    # input passwordInput
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # page should contain element
    Error Message Shown
    