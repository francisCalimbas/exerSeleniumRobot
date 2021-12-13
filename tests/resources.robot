*** Settings ***
Documentation   Documentation A test suite with a single test for valid login
...             
...             Creating system specific keywords from default keywords.
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              edge
${DELAY}                0
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${VALID PASSWORD}       secret_sauce
${LOGIN URL}            https://${SERVER}/
${HOME URL}             https://${SERVER}/inventory.html
${INVALID PASSWORD}     oraoraora

*** Keywords ***
Open Browser To Login Page
     # open browser
    Open Browser    ${LOGIN URL}     edge
    # set window size
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Login Page Should Be Open
    
Login Page Should Be Open
    # check if in login page
    Page Should Contain Element     login-button

Product Page Should Be Open
    Element Text Should Be      class:title     PRODUCTS
    #Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out.

Input Username
    [Arguments]     ${username}
    # input username
    Input Text  user-name    ${username}

Input Password
    [Arguments]     ${password}
    # input password
    SeleniumLibrary.Input Password  password    ${password}

Submit Credentials
    Click Button    login-button

Error Message Shown
    # page should contain element
    Page Should Contain Element    class:error-message-container
    #Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out.
    #Element Text Should Be      css:*[data-test="error"]        ${error}

Login Should Be Successful
    # page should contain element
    Page Should Contain Element    id:inventory_container

Login Should Have Failed
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3   Epic sadface: Username and password do not match any user in this service