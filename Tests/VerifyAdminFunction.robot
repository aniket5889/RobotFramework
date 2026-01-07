*** Settings ***
Library     SeleniumLibrary
Library     ../Libraries/UserDataGenerator.py
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


TC07 - Create User And Search Verification
    Run On All Browsers    Create Search And Verify User Flow


*** Keywords ***

Admin Menu Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}
    Sleep    2s
    Verify Admin Menu Is Visible


Create Search And Verify User Flow
    Login To OrangeHRM    ${USERNAME}    ${PASSWORD}

    ${username}    ${password}    ${role}    ${status}=    Generate User Data
    ${employee_name}=    Set Variable    Ranga Akunuri

    Log To Console    \nCreated User -> ${username} | ${role} | ${status} | ${employee_name}

    Create user in Admin Page    ${username}    ${password}    ${role}    ${status}

    Verify Landing on Admin Page

    Wait Until Element Is Visible    ${RESET_BUTTON}    10s
    Click Element Safe               ${RESET_BUTTON}

    Wait Until Element Is Visible    ${SEARCH_USERNAME_INPUT}    10s
    Clear Element Text               ${SEARCH_USERNAME_INPUT}
    Input Text                       ${SEARCH_USERNAME_INPUT}    ${username}

    Click Element Safe               ${SEARCH_BUTTON}

    Wait Until Element Is Visible    xpath=//div[@role='cell' and normalize-space()='${username}']    15s

    Log To Console    User '${username}' successfully found in Admin search
