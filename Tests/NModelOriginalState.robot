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

Verify that user can disconnect the newly dataset
    [Documentation]  This Testcase Verify that user can disconnect the newly dataset
    [Tags]  Testcase 1
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 2
    When User Disconnects Additional Dataset
    Then Verify That The Page Is Not In Processing State

Verify that “Only one dadaset” should be shown as connected on model overview.
    [Documentation]  This testcase to Verify that “Only one dadaset” should be shown as connected on model overview.
    [Tags]  Testcase 2
    Given User Navigate/Login To App and Navigates To Workspace 387
    When User Is On Model Overview
    Then Verify “Only one dadaset” should be shown as connected
