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
    Given Input user credential
          Confirm Cookie
    When Press login button
    Then Confirm user logged in

User Navigate To Workspace
    [Documentation]  Testcase for user navigate to Workspace
    [Tags]  Testcase 2
    Given Confirm user logged in
    When Open top burger drop down menu
    Then Navigate to Workspace 387
User Creat a Model
    [Documentation]  Testcase for user creat a model on labelf
    [Tags]  Testcase 3
    Go to  https://app.labelf.ai/main/387/models/view
    Creat a Model
    Select an Existing Dataset
    Set Name and Description For Model
    Verify your Model Exist

Delete Single Model
    [Documentation]  Testcase for deleting a model, to be used after creating a model. Doesn't work with more than 1 model on workspace.
    [Tags]  Testcase 4

    Given User Is Logged In And On An Workspace Containing One Model
    When User Opens Single Model Options Dropdown List
    And User Clicks Delete Model Option
    Then Workspace Is Empty
