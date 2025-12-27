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


TC02 - Logout From Application
    Run On All Browsers    Logout Flow

*** Keywords ***
Logout Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Logout From Application
    Sleep    2s
    Verify Login Page Is Visible