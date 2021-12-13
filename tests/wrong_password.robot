*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             This test follows the exmaple using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Wrong Password
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input passwordInput
    Input Password  ${INVALID PASSWORD}
    # click login button
    Submit Credentials
    # page should display error message
    Login Should Have Failed
    