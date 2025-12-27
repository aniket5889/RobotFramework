*** Settings ***
Library  SeleniumLibrary
Resource  ../Pages/BasePage.robot

*** Variables ***
${admin_header}    xpath=//span[text()="Admin"]
${admin_page_identifier}    xpath=//h6[text()="User Management"]

*** Keywords ***
Verify Landing on Admin Page
    Wait Until Element Is Visible    ${admin_header}    10s
    Click Element Safe    ${admin_header}
    Wait Until Page Contains Element    ${admin_page_identifier}    10s
    