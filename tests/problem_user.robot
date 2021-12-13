*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             This test follows the exmaple using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Problem User
    Open Browser To Login Page
    # input username
    Input Username  ${PROBLEM USER}
    # input passwordInput
    Input Password  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # successfully logged in as problem user
    Logged In As Problem User
    