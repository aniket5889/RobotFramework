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
TC01 - Valid Login And Dashboard Verification
    Run On All Browsers    Valid Login Flow

*** Keywords ***
Valid Login Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Sleep    2s
    Verify Dashboard Is Visible

    