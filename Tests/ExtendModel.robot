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

# KI-97 refactoring
Verify That The Model Shall Be In State Processing When A New Dataset Is Connected.
    [Documentation]  This Testcase Verify that the model is in processing.
    [Tags]  Testcase 2
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 3  #Model ID:3084
    When User Adds A New Additional Dataset To Model
    Then Verify That The Model Is In Processing State

#new test task ki 96
Verify the number of data points in the model is increased.
    [Documentation]  This testcase to Verify the number of data points in the model is increased.
    [Tags]  Testcase 1
    Given User Navigate To Model Overview App 4
    When User Connects The New Dataset From The Model Overview
    And Check The Number Of DatPoints Before Adding Additional DataSet
    And Check The Number Of DatPoints After Adding Additional DataSet
    Then Verify That The number of dataPoints in the model is increased