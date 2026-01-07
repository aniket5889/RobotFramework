*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resources/variables.robot

*** Keywords ***
Run On All Browsers
    [Arguments]    ${test_flow}

    ${failed_browsers}=    Create List

    FOR    ${browser}    IN    @{BROWSERS}
        Log To Console    \n\n===== Running ${test_flow} on ${browser} =====

        TRY
            Open Browser    ${URL}    ${browser}
            Maximize Browser Window
            Set Selenium Timeout    15s

            Run Keyword    ${test_flow}

        EXCEPT
            Log To Console    ${test_flow} FAILED on ${browser}
            Capture Page Screenshot    ${test_flow}_${browser}.png
            Append To List    ${failed_browsers}    ${browser}

        FINALLY
            Close All Browsers
        END
    END

    Run Keyword If    ${failed_browsers}    Fail
    ...    ${test_flow} failed on browsers: ${failed_browsers}


