*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             This test follows the exmaple using keywords from
...             the SeleniumLibrary
Library         SeleniumLibrary

*** Test Cases ***
Valid Login
    # open browser
    Open Browser    https://www.saucedemo.com/     edge
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name    standard_user
    # input passwordInput
    SeleniumLibrary.Input Password    password   secret_sauce
    # click login button
    Click Button    login-button
    # page should contain element 
    Page Should Contain Element    id:inventory_container
    # close browser
    [Teardown]     Close Browser