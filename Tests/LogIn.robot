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

User login to Labelf
    [Documentation]  Testcase for user login to labelf
    [Tags]  Testcase 1
    Given input user credential
          Confirm Cookie
    When press login button
    Then Confirm user logged in

User Creat a Model
    [Documentation]  Testcase for user creat a model on labelf
    [Tags]  Testcase 2
    Input User Credential
    Confirm Cookie
    Press Login Button
    Creat a Model
    Select an Existing Dataset
    Set Name and Description For Model
    Verify your Model Exist
