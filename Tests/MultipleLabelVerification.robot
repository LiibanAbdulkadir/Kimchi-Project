*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot


Library  SeleniumLibrary
Library  String

Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***

Verify that Sum Of confidence levels is higher than 100%
    [Documentation]  This Testcase Verify that Sum Of confidence levels is higher than 100% (Uses data from orginal datapoint)
    [Tags]  Testcase 1
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App
    When User Inputs Test Sentence From Orginal Dataset into "Test Your Model"
    Then Retrive Confidence Level And Verify Confidence Is Higher Than 100% When Sum


Verify that one confidence level at least 50% when multiple lables are classified for a question
    [Documentation]  This Testcase Verify that one confidence level at least 50% when multiple lables are classified for a question
    [Tags]  Testcase 2
    Given User Navigate To Model Overview App
    When User Inputs New Test Sentence With Multiple Labels into "Test Your Model"
    Then Retrive Confidence Level And Verify that Confidence Is Higher Than 50% When Sum
