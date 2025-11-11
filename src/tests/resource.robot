*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}             localhost:5001
${DELAY}              0.5 seconds
${HOME_URL}           http://${SERVER}
${CHROMEDRIVER_PATH}  /home/santersi/bin/chromedriver

*** Keywords ***
Open And Configure Browser
    Set Selenium Speed    ${DELAY}
    ${options}=    Evaluate    __import__('selenium.webdriver.chrome.options', fromlist=['Options']).Options()
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    ${service}=    Evaluate    __import__('selenium.webdriver.chrome.service', fromlist=['Service']).Service("${CHROMEDRIVER_PATH}")
    Create Webdriver    Chrome    service=${service}    options=${options}
    Go To    ${HOME_URL}
