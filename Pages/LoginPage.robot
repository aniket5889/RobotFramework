*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username_field}    name=username
${password_field}    name=password
${login_button}      xpath=//button[@type='submit']
${error_message}     xpath=//p[contains(@class,'alert-content-text')]

*** Keywords ***
Login To OrangeHRM
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${username_field}    10s
    Input Text    ${username_field}    ${username}
    Input Text    ${password_field}    ${password}
    Click Button  ${login_button}

Verify Invalid Login Message
    Wait Until Element Is Visible    ${error_message}    5s
