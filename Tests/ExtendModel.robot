*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/OrignalStateKeywords.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot


Library  SeleniumLibrary


Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***

Verify That The Model Shall Be In State Processing When A New Dataset Is Connected.
    [Documentation]  This Testcase Verify that the model is in processing.
    [Tags]  Testcase 2
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 3  #Model ID:3084
    When User Adds A New Additional Dataset To Model
    Then Verify That The Model Is In Processing State

*** Keywords ***

User Navigate To Model Overview App 3
    Wait Until Page Contains  Team Kimchi
    Click Element  ${ModelID3084NameButtonInWorkspace}
    Wait Until Page Contains Element  ${StartTrainingButton}

User Adds A New Additional Dataset To Model
    Scroll Element Into View  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains Element  ${ContinueButtonDatasetID470}
    Click Element  ${ContinueButtonDatasetID470}

Verify That The Model Is In Processing State
    Wait Until Page Contains  Datasets available to connect
    Scroll Element Into View  ${ConnectButton}
    Wait Until Page Contains Element  ${ConnectButton}
    Click Element  ${ConnectButton}
    Page Should Contain  Second multilabeled dataset
    Click Element  ${ModelsButtonInMainBar}
    Wait Until Page Contains  Team Kimchi
    Page Should Contain  Processing