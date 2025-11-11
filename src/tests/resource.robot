*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     0.5 seconds
${HOME_URL}  http://${SERVER}
${BROWSER}   chrome
${HEADLESS}  false

*** Keywords ***
Open And Configure Browser
    ${options}=    Set Variable    ${EMPTY}
    IF  $BROWSER == 'chrome'
        ${options}=    Set Variable    --incognito
    ELSE IF  $BROWSER == 'firefox'
        ${options}=    Set Variable    --private-window
    END
    IF  $HEADLESS == 'true'
        ${options}=    Set Variable    ${options} --headless
        Set Selenium Speed  0.05 seconds
    ELSE
        Set Selenium Speed  ${DELAY}
    END
    Open Browser  ${HOME_URL}  ${BROWSER}  options=${options}
