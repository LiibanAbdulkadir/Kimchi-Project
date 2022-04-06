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

User Login To Labelf
    [Documentation]  Testcase for user login to labelf
    [Tags]  Testcase 1
    Given Input User Credential
          Confirm Cookie
    When Press Login Button
    Then Confirm User Logged In

User Navigate To Workspace
    [Documentation]  Testcase for user navigate to Workspace
    [Tags]  Testcase 2
    Given Confirm User Logged In
    When Open Top Burger Drop Down Menu
    Then Navigate To Workspace 387

User Creat a Model
    [Documentation]  Testcase for user creat a model on labelf
    [Tags]  Testcase 3
    Go to  https://app.labelf.ai/main/387/models/view
    Creat A Model
    Select An Existing Dataset
    Set Name And Description For Model
    Verify Your Model Exist