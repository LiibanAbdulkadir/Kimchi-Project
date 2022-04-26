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
    Execute Javascript  window.scrollTo(0,1800)
    Wait Until Element Is Visible   ${labelsPpieChart}

    Wait Until Page Contains  Sport
    Wait Until Page Contains  Economy








