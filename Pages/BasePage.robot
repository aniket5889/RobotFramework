*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Click Element Safe
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  10s
    Click Element  ${locator}

Enter Text Safe
    [Arguments]  ${locator}  ${value}
    Wait Until Element Is Visible  ${locator}  10s
    Input Text  ${locator}  ${value}
