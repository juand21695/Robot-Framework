*** Settings ***
Documentation       Test suite for login functionality
Library             SeleniumLibrary
Suite Teardown      Close All Browsers

*** Variables ***
${LOGIN_URL}        https://practicetestautomation.com/practice-test-login/
${BROWSER}          Chrome
${VALID_USERNAME}   student
${VALID_PASSWORD}   Password123
${SUCCESS_URL}      https://practicetestautomation.com/logged-in-successfully/

*** Test Cases ***
Valid Login Test
    Open Browser To Login Page
    Input Valid Credentials
    Submit Login Form
    Verify Successful Login
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Test Login | Practice Test Automation

Input Valid Credentials
    Input Text    id=username    ${VALID_USERNAME}
    Input Password    id=password    ${VALID_PASSWORD}

Submit Login Form
    Click Button    id=submit

Verify Successful Login
    Wait Until Location Is    ${SUCCESS_URL}    timeout=10s
    Wait Until Page Contains Element    css=.post-title    timeout=5s
    Element Should Contain    css=.post-title    Logged In Successfully
    Page Should Contain Element    css=.wp-block-button
    Sleep    2s