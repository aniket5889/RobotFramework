*** Settings ***
Library  SeleniumLibrary
Resource  ../Pages/BasePage.robot

*** Variables ***
${recruitment_header}    xpath=//span[text()="Recruitment"]
${recruitment_page_identifier}    xpath=//a[text()="Candidates"]

*** Keywords ***
Verify Landing on Recruitment Page
    Sleep    2s
    Wait Until Element Is Visible    ${recruitment_header}    10s
    Click Element Safe    ${recruitment_header}
    Wait Until Page Contains Element    ${recruitment_page_identifier}    10s