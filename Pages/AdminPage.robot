*** Settings ***
Library     SeleniumLibrary
Library     ../Libraries/UserDataGenerator.py
Resource    ../Pages/BasePage.robot

*** Variables ***
${ADMIN_HEADER}              xpath=//span[normalize-space()='Admin']
${ADMIN_PAGE_HEADER}         xpath=//h6[normalize-space()='User Management']

${SEARCH_USERNAME_INPUT}     xpath=//label[normalize-space()='Username']/following::input[1]
${SEARCH_BUTTON}             xpath=//button[normalize-space()='Search']
${RESET_BUTTON}              xpath=//button[normalize-space()='Reset']

${SUCCESS_TOAST}             xpath=//div[contains(@class,'oxd-toast--success')]

*** Keywords ***

Verify Landing on Admin Page
    Wait Until Element Is Visible    ${ADMIN_HEADER}    15s
    Wait Until Element Is Enabled    ${ADMIN_HEADER}    15s
    Click Element Safe               ${ADMIN_HEADER}
    Wait Until Element Is Visible    ${ADMIN_PAGE_HEADER}    15s

Input Text Safe
    [Arguments]    ${locator}    ${text}

    Wait Until Element Is Visible    ${locator}    15s
    Wait Until Element Is Enabled    ${locator}    15s

    Click Element    ${locator}
    Sleep    200ms

    Press Keys    ${locator}    CTRL+A
    Press Keys    ${locator}    BACKSPACE

    Input Text    ${locator}    ${text}


Select From Custom Dropdown
    [Arguments]    ${label}    ${value}

    ${dropdown}=    Set Variable    xpath=//label[normalize-space()='${label}']/following::div[contains(@class,'oxd-select-text')][1]

    Wait Until Element Is Visible    ${dropdown}    15s
    Wait Until Element Is Enabled    ${dropdown}    15s

    Click Element    ${dropdown}
    Sleep    300ms

    Press Keys    ${dropdown}    ${value}
    Sleep    300ms
    Press Keys    ${dropdown}    ENTER



Select Employee From Autocomplete
    [Arguments]    ${employee_name}

    ${input}=    Set Variable    xpath=//div[contains(@class,'oxd-autocomplete-text-input')]//input

    Wait Until Element Is Visible    ${input}    15s
    Wait Until Element Is Enabled    ${input}    15s

    Click Element    ${input}
    Sleep    200ms

    Press Keys    ${input}    CTRL+A
    Press Keys    ${input}    BACKSPACE

    Input Text    ${input}    ${employee_name}

    Wait Until Element Is Visible    xpath=//div[@role='listbox']//span[normalize-space()='${employee_name}']    15s

    Click Element    xpath=//div[@role='listbox']//span[normalize-space()='${employee_name}']


Create user in Admin Page
    [Arguments]    ${username}    ${password}    ${role}    ${status}
    ${employee_name}=    Set Variable    Ranga Akunuri

    Verify Landing on Admin Page

    Click Element Safe    xpath=//button[.//text()[normalize-space()='Add']]
    Wait Until Element Is Visible    xpath=//h6[normalize-space()='Add User']    15s

    Select From OrangeHRM Dropdown    User Role    Admin

    Select Employee From Autocomplete     ${employee_name}
    Select From OrangeHRM Dropdown    Status       Enabled
    

    Input Text Safe    xpath=//label[normalize-space()='Username']/following::input[1]    ${username}
    Input Text Safe    xpath=//label[normalize-space()='Password']/following::input[1]    ${password}
    Input Text Safe    xpath=//label[normalize-space()='Confirm Password']/following::input[1]    ${password}

    Click Element Safe    xpath=//button[.//text()[normalize-space()='Save']]
    Wait Until Element Is Visible    ${SUCCESS_TOAST}    15s


Search And Verify Created User
    ${CREATED_USERNAME}=    Get Created Username

    Verify Landing on Admin Page
    Click Element Safe    ${RESET_BUTTON}

    Input Text Safe    ${SEARCH_USERNAME_INPUT}    ${CREATED_USERNAME}
    Click Element Safe    ${SEARCH_BUTTON}

    Wait Until Element Is Visible    xpath=//div[@role='cell' and normalize-space()='${CREATED_USERNAME}']    15s

Select From OrangeHRM Dropdown
    [Arguments]    ${label_text}    ${option_text}
    ${dropdown}=    Set Variable    xpath=//label[normalize-space()='${label_text}']/following::div[contains(@class,'oxd-select-text')][1]

    Wait Until Element Is Visible    ${dropdown}    15s
    Wait Until Element Is Enabled    ${dropdown}    15s
    Click Element    ${dropdown}

    ${option}=    Set Variable    xpath=//div[@role='listbox']//span[normalize-space()='${option_text}']

    Wait Until Element Is Visible    ${option}    15s
    Click Element    ${option}

