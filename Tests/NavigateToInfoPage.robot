*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/variables.robot
Resource    ../Resources/browser_keywords.robot
Resource    ../Pages/LoginPage.robot
Resource    ../Pages/DashboardPage.robot
Resource    ../Pages/TopMenuPage.robot
Resource    ../Pages/MyInfoPage.robot
Resource    ../Pages/AdminPage.robot

*** Test Cases ***

TC03 - Navigate To My Info Page
    Run On All Browsers    My Info Flow

*** Keywords ***
My Info Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Sleep    2s
    Navigate To My Info
    Verify My Info Page Is Visible