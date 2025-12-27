*** Settings ***
Library  SeleniumLibrary
Resource  ../Pages/BasePage.robot
Resource  ../Pages/RecruitmentPage.robot
Resource  ../Pages/LoginPage.robot
Resource  ../Resources/browser_keywords.robot

*** Variables ***
${recruitment_menu}    xpath=//span[text()='Recruitment']
${candidates_page_identifier}    xpath=//a[text()="Candidates"]

*** Test Cases ***
TC07 - Navigate to Recruitment Page
    Run On All Browsers    Navigate To Recruitment Page Flow

*** Keywords ***
Navigate To Recruitment Page Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Sleep    2s
    Verify Landing on Recruitment Page