*** Settings ***
Library     Selenium2Library
Documentation   A test suite with a single test for valid login

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:8080
${USER}     admin
${PASSWORD}     admin

*** Test Cases ***
TC_001 Login Localhost
    Open localhost
    Log in localhost     ${USER}     ${PASSWORD}

*** Keywords ***
Open localhost
    Open Browser    ${URL}  ${BROWSER}
    Wait Until Page Contains    Entrar

Log in localhost
    [Arguments]     ${user}    ${password}
    Input Text    username    ${user}
    Input Password    password    ${password}
    Click Button    Entrar
    Wait Until Page Contains    Buscador
    [Teardown]  Close Browser