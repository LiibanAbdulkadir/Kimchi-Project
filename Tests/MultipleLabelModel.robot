*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot

Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

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

Verify Radio Button Is Shown
    [Documentation]  Verify Radio Button Is Shown When Multiple Choice Is Clicked
    [Tags]  Testcase 7
    Given Multiple choice Is Provided As Option
    When Multiple Choice Is Selected
    Then Radio Button Is Shown

#Train Model with MultipleLabels
#    [Documentation]  Train Model with MultipleLabels
#    [Tags]  Testcase 8
#    Given Radio Button Is Shown
#    When Model Is Trained with LabelOne One Time
#    And Model Is Trained with LabelTwo Two Times
#    And Model Is Trained with Both Labels One Time
#    Then Verify MultipleLabels Are Shown In Report

Train dataset and add third label
    [Documentation]  Train Model with MultipleLabels
    [Tags]  Testcase 8
    Given Radio Button Is Shown
    When Model Is Trained with MultipleLables
    Then Verify MultipleLabels Are Shown In Report


Delete Single Model
    [Documentation]  Deletes single model, only to be used on workspace with only 1 model.
    [Tags]  Testcase 4
    Given User Is Logged In And On An Workspace Containing One Model
    When User Opens Single Model Options Dropdown List
    And User Clicks Delete Model Option
    Then Workspace Is Empty








