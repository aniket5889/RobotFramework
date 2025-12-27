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
TC06 - Click On Admin Header
    Run On All Browsers    Click on Admin Header

*** Keywords ***
Click on Admin Header
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Sleep    5s
    Verify Landing on Admin Page