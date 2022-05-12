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

Verify that the models shall be in state processing when a new data set is connected.
    [Documentation]  This Testcase Verify that the model is in processing.
    [Tags]  Testcase 2
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 3  #Model ID:3084
    When User Adds A New Additional Dataset To Model
    Then Verify That The Model Is In Processing State

*** Keywords ***

User Navigate To Model Overview App 3
    Wait Until Page Contains  Team Kimchi
    Click Element  //*[@id="app"]/div[9]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/div[1]/a   #${AppWorkspaceModelName}
    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div  #${StartTrainingButton}

User Adds A New Additional Dataset To Model
    Scroll Element Into View  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button  #${ConnectAddtionalDatasetButton}
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains Element  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button  #${ContinueButtonDatasetID470}
    Click Element  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button  #${ContinueButtonDatasetID470}

Verify That The Model Is In Processing State
    Wait Until Page Contains  Datasets available to connect
    Scroll Element Into View  ${ConnectButton}
    Wait Until Page Contains Element  ${ConnectButton}
    Click Element  ${ConnectButton}
    Page Should Contain  Second multilabeled dataset
    Click Element  //*[@id="models-button-navbar"]/div  #${ModelsButtonInMainBar}
    Wait Until Page Contains  Team Kimchi
    Page Should Contain  Processing