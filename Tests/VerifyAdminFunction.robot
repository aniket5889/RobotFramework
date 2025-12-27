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


TC04 - Verify Admin Menu Visibility
    Run On All Browsers    Admin Menu Flow

*** Keywords ***
Admin Menu Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Sleep    2s
    Verify Admin Menu Is Visible