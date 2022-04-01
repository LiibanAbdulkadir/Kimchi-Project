*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${BROWSER}  headlesschrome
${URL}  https://app.labelf.ai/login

*** Test Cases ***
Open Web Page And Verify
    [Tags]  Smoke
    Navigate To Labelf Web Page