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

User Adds Additional Dataset
    [Documentation]  This Testcase Adds Additional Dataset to model and disconnects dataset in NModel to minimize time waste.
    [Tags]  Testcase 1
    Given User Navigate/Login To App and Navigates To Workspace 387
          User Navigate To Model Overview App 2
    When User Adds Additional Dataset To Model


