*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${dashboard_header}    xpath=//h6[text()='Dashboard']

*** Keywords ***
Verify Dashboard Is Visible
    Wait Until Element Is Visible    ${dashboard_header}    10s


Verify Login Page Is Visible
    Wait Until Page Contains Element    name=username    10s
