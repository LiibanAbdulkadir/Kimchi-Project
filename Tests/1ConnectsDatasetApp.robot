*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/OrignalStateKeywords.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot



Library  SeleniumLibrary
Library  ../Scripts/remove_total_items_text.py
Library  String


Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***

User Adds Additional Dataset
    [Documentation]  This Testcase Adds Additional Dataset to model and disconnects dataset in NModel to minimize time waste.
    [Tags]  Testcase 1 appWorkspace
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 2
    When User Adds Additional Dataset To Model 2

Verify That The Model Shall Be In State Processing When A New Dataset Is Connected.
    [Documentation]  This Testcase Verify that the model is in processing.
    [Tags]  Testcase 2 appWorkspace
    Given Navigate To Workspace 387
          User Navigate To Model Overview App 3  #Model ID:3084
    When User Adds A New Additional Dataset To Model 3
    Then Verify That The Model Is In Processing State

Verify the number of data points in the model is increased.
    [Documentation]  This testcase to Verify the number of data points in the model is increased.
    [Tags]  Testcase 3 appWorkspace
    Given Navigate To Workspace 387
          User Navigate To Model Overview App 4
    When User Connects The New Dataset From The Model Overview 4
    And Check The Number Of DatPoints Before Adding Additional DataSet App 4
    And Check The Number Of DatPoints After Adding Additional DataSet App 4
    Then Verify That The number of dataPoints in the model is increased App 4