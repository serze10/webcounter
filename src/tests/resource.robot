*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${BROWSER}   chrome
${HEADLESS}  false

*** Keywords ***
Open And Configure Browser
    ${options}=    Create List
    IF    $BROWSER == 'chrome'
        Append To List    ${options}    --incognito
    ELSE IF    $BROWSER == 'firefox'
        Append To List    ${options}    --private-window
    END
    IF    $HEADLESS == 'true'
        Append To List    ${options}    --headless
        Set Selenium Speed    0.05 seconds
    ELSE
        Set Selenium Speed    ${DELAY}
    END
    Open Browser    ${HOME_URL}    ${BROWSER}    arguments=${options}