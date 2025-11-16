*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${SERVER}    localhost:5001
${HOME_URL}  http://${SERVER}
${HEADLESS}  true

*** Keywords ***
Open And Configure Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Firefox    options=${options}
    Set Window Size    1920    1080
    Go To    ${HOME_URL}
    Reset Counter


Reset Counter
    Click Button    Nollaa
