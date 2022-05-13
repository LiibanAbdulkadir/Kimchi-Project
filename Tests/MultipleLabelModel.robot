*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
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
    [Tags]  Testcase 1  stagWorkspace
    Given Go To  ${StagLoginSite}
          Input User Credential
          Confirm Cookie
    When Press Login Button
    Then Confirm User Logged In

Create A Model For Dataset
    [Documentation]  Creates a single model for Costumer service response
    [Tags]  Testcase 5  stagWorkspace
    Given User Is Logged In And On An Empty Workspace
    When User Clicks Button "New Model" And To Create A New Model From Scratch
    And Select Costumer Service Response as Dataset
    And Set A Name And Description For Model
    Then Model Is Created On Workspace

Adds Two Labels To Model
    [Documentation]  Adds Two Labels and Verify That They Show Up
    [Tags]  Testcase 6  stagWorkspace
    Given User Is Logged In And On An Workspace Containing One Model
    When User Clicks Button "Overview" And "Start Training" And "Add a label"
    And Input Label Name And Click Add label
    Then Multiple Choice Is Provided As Option

Verify Radio Button Is Shown
    [Documentation]  Verify Radio Button Is Shown When Multiple Choice Is Clicked
    [Tags]  Testcase 7  stagWorkspace
    Given Multiple Choice Is Provided As Option
    When Multiple Choice Is Selected
    Then Radio Buttons For Created Labels Is Shown

Train dataset and add third label
    [Documentation]  Train Model with MultipleLabels
    [Tags]  Testcase 8  stagWorkspace
    Given Radio Buttons For Created Labels Is Shown
    When Model Is Trained with MultipleLables
    And A Third Label Is Added To Model
    Then All Labels Are Possible To Select

Verify Model Overview Reports
    [Documentation]  Verify training of model shows properly on model overview page
    [Tags]  Testcase 9  stagWorkspace
    Given That Model Is Trained With Three Labels
    When User Navigate To Model Overview
    Then The Trained Labels Are Shown In Report












