*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}  https://app.labelf.ai/login


*** Test Cases ***
Open Web Page And Verify
    [Documentation]
    [Tags]  Smoke
    Navigate To labelf web page
