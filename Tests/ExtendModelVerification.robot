*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot


Library  SeleniumLibrary
Library  String
Library  ../Scripts/remove_total_items_text.py

Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***
#new test task ki 96
Verify the number of data points in the model is increased.
    [Documentation]  This testcase to Verify the number of data points in the model is increased.
    [Tags]  Testcase 1
     Given User Navigate/Login To App and Navigates To Workspace 387
           User Navigate To Model Overview App 4
    When User Connects The New Dataset From The Model Overview
    And Check The Number Of DatPoints Before Adding Additional DataSet
    And Check The Number Of DatPoints After Adding Additional DataSet
    Then Verify That The number of dataPoints in the model is increased


*** Keywords ***

user Navigate To Model Overview App 4
    Wait Until Page Contains  Models
    Click Element  ${ModelID3085NameButtonInWorkspace}

User Connects The New Dataset From The Model Overview
    Execute Javascript  window.scrollTo(0,1000)
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect
    Click Element  ${ContinueButtonDatasetID470}
    Wait Until Page Contains  Select the column which contains the text
    Scroll Element Into View  ${ConnectButton}
    Click element  ${ConnectButton}


Check The Number Of DatPoints Before Adding Additional DataSet
    go to  https://app.labelf.ai/main/387/models/view
    Wait Until Element Is Visible  ${NumberTextBefore}
    ${NumberString}  Get Text  ${NumberTextBefore}
    ${IntbeforeIncrease}  Removetext   ${NumberString}
    Set Global Variable  ${IntbeforeIncrease}

Check The Number Of DatPoints After Adding Additional DataSet
    Wait Until Element Is Visible  ${StringNumberAfterAddDataSet}
    ${NumberString}  Get Text  ${StringNumberAfterAddDataSet}
     ${IntAfterIncrease}  Removetext   ${NumberString}
    Set Global Variable  ${IntAfterIncrease}


Verify That The number of dataPoints in the model is increased
    go to  https://app.labelf.ai/main/387/models/view
    Wait Until Element Is Visible  ${StringNumberAfterAddDataSet}
    Should Be True  ${IntbeforeIncrease} < ${IntAfterIncrease}
    Log to console  ${IntbeforeIncrease} < ${IntAfterIncrease}



