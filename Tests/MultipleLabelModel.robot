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
Train dataset and add third label
    Click Element  //button[contains(.,'Multiple Choice')]
    Wait until Page Contains  Lets start by giving Labelf 20 samples
    Page Should Contain Element  //div[contains(text(),'Sport')]
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
    Click Button  //button[contains(.,' Add ')]
    Wait until Page Contains  Lets start by giving Labelf 19 samples
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
    Click Button  //button[contains(.,' Add ')]
    Wait until Page Contains  Lets start by giving Labelf 18 samples
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
    Click Button  //button[contains(.,' Add ')]


    Go To  ${StagWorkspaceModelView}
    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div

Verify MultipleLabels Are Shown In Report
    Wait Until Page Contains  Overview
    Scroll Element Into View  //*[contains(text(),'Connected Datasets')]
    Wait Until Page Contains  Sport
    Wait Until Page Contains  Economy
    Scroll Element Into View  //*[contains(text(),'Predicted Label Distribution')]
    Wait Until Page Contains  Predicted Label Distribution
    Wait Until Page Contains  Sport
    Wait Until Page Contains  Economy








