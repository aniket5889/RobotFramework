*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${personal_details_header}    xpath=//h6[text()='Personal Details']

*** Keywords ***
Verify My Info Page Is Visible
    Sleep    2s
    Wait Until Element Is Visible    ${personal_details_header}    10s
