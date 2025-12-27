*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_dropdown}    xpath=//p[contains(@class,'userdropdown')]
${logout_button}    xpath=//a[text()='Logout']
${admin_menu}       xpath=//span[text()='Admin']
${myinfo_menu}      xpath=//span[text()='My Info']

*** Keywords ***
Logout From Application
    Wait Until Element Is Visible    ${user_dropdown}    5s
    Click Element    ${user_dropdown}
    Wait Until Element Is Visible    ${logout_button}    5s
    Click Element    ${logout_button}

Verify Admin Menu Is Visible
    Wait Until Element Is Visible    ${admin_menu}    10s
    Element Should Be Visible    ${admin_menu}

Navigate To My Info
    Wait Until Element Is Visible    ${myinfo_menu}    10s
    Click Element    ${myinfo_menu}
