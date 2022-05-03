*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot


Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***

Verify that Sum Of confidence levels is higher than 100%
    [Documentation]  This Testcase Verify that Sum Of confidence levels is higher than 100%
    [Tags]  Testcase 1
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App
    When User Inputs Test Sentence into "Test Your Model"
    Then Verify Confidence Is Higher Than 100% When Sum
