*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot

Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Model Creation Test

*** Variables ***

${BROWSER}  chrome


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
    Then Navigate To Workspace 60

Create A Model For Dataset
    [Documentation]  Creates a single model for Costumer service response
    [Tags]  Testcase 5
    Given User Is Logged In And On An Empty Workspace
    When User Clicks Button "New Model" And To Create A New Model From Scratch
    And Select Costumer Service Response as Dataset
    And Set A Name And Description For Model
    Then Model Is Created On Workspace

Adds Two Labels To Model
    [Documentation]  Adds Two Labels and Verify That They Show Up
    [Tags]  Testcase 6
    Given User Is Logged In And On An Workspace Containing One Model
    When User Clicks Button "Overview" And "Start Training" And "Add a label"
    And Input Label Name And Click Add label
    Then Multiple choice Is Provided As Option









