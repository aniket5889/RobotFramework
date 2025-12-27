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

TC05 - Invalid Login Validation
    Run On All Browsers    Invalid Login Flow

*** Keywords ***
Invalid Login Flow
    Login To OrangeHRM    InvalidUser    InvalidPass
    Verify Invalid Login Message
