*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/OrignalStateKeywords.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot



Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***
Verify that user can disconnect the newly dataset
    [Documentation]  This Testcase Verify that user can disconnect the newly dataset
    [Tags]  Testcase 1  appWorkspace
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 2
    When User Disconnects Additional Dataset
    Then Verify That The Page Is Not In Processing State


Disconnects Dataset for app 3 and 4
    [Documentation]  This testcase Disconnects Dataset for app 3 and 4
    [Tags]  Testcase 5 appWorkspace
    Navigate to Workspace 387
    Disconnects Dataset for Model 3 and 4

