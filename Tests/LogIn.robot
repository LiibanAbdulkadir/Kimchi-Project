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
    Given User Is In Workspace 387
    When User Creats A Model
    And User Selects An Existing Dataset
    And User Sets Name And Description For Model
    Then Model Is Created On Workspace

Delete Single Model
    [Documentation]  Deletes single model, only to be used on workspace with only 1 model.
    [Tags]  Testcase 4
    Given User Is Logged In And On An Workspace Containing One Model
    When User Opens Single Model Options Dropdown List
    And User Clicks Delete Model Option
    Then Workspace Is Empty