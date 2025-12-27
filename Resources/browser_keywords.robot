*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/variables.robot

*** Keywords ***
Run On All Browsers
    [Arguments]    ${test_flow}
    FOR    ${browser}    IN    @{BROWSERS}
        Log To Console    \n\n===== Running ${test_flow} on ${browser} =====
        Open Browser    ${URL}    ${browser}
        Maximize Browser Window

        TRY
            Run Keyword    ${test_flow}
        EXCEPT
            Log To Console    ❌ Test Failed on ${browser} - Capturing Screenshot
            Capture Page Screenshot    ${test_flow}_${browser}.png
            Fail    Test failed on ${browser}
        FINALLY
            Close Browser
        END
    END

