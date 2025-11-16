*** Settings ***
Resource        resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
When value is set to 10 the counter shows 10
    Go To    ${HOME_URL}
    Input Text    value    10
    Click Button    aseta
    Page Should Contain    nappia painettu 10 kertaa