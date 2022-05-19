*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot
Resource  ../Resources/OrignalStateKeywords.robot


Library  SeleniumLibrary
Library  String


Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***
Verify that Sum Of confidence levels is higher than 100%
    [Documentation]  This Testcase Verify that Sum Of confidence levels is higher than 100% (Uses data from orginal datapoint)
    [Tags]  Testcase 1 appWorkspace
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 1
    When User Inputs Test Sentence From Orginal Dataset into "Test Your Model"
    Then Retrive Confidence Level And Verify Confidence Is Higher Than 100% When Sum

Verify that one confidence level at least 50% when multiple lables are classified for a question
    [Documentation]  This Testcase Verify that one confidence level at least 50% when multiple lables are classified for a question
    [Tags]  Testcase 2 appWorkspace
    Given User Navigate To Model Overview App 1
    When User Inputs New Test Sentence With Multiple Labels into "Test Your Model"
    Then Retrive Confidence Level And Verify that Confidence Is Higher Than 50% When Sum

Verify that the categorization confidence levels matches the label of the original datapoint
    [Documentation]  This testcase Verify that the categorization confidence levels matches the label of the original datapoint
    [Tags]  Testcase 3 appWorkspace
    Given User Navigate To Model Overview App 1
    When User Inputs confidence levels Sentence matches the label of the original datapoint into "Test Your Model"
    Then Confidence levels matches the label of the original datapoint

Verify the categorization confidence levels matches the labeling with first dataset.
    [Documentation]  This testcase to Verify the categorization confidence levels matches the labeling with first dataset
    [Tags]  Testcase 4 appWorkspace
    Given Navigate To Workspace 387
          User Navigate To Model Overview App 4
    When User Inputs an example from the first dataset to the test the model
    Then Confidence levels matches the label of the original datapoint

Verify the categorization confidence levels matches the labeling with newly added dataset.
    [Documentation]  This testcase to Verify the categorization confidence levels matches the labeling with first dataset
    [Tags]  Testcase 6 appWorkspace
    Given Navigate to Workspace 387
          User Navigate To Model Overview App 4
    When User Inputs an example from the newly dataset to the test the model
    Then Confidence levels matches the label of the original datapoint
