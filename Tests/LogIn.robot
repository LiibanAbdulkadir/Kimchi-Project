*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary


Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}  https://app.labelf.ai/login

*** Test Cases ***
Open Web Page And Verify
    [Documentation]
    [Tags]  Smoke
    Navigate To labelf web page
