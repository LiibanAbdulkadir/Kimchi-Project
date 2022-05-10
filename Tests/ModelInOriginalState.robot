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
          User Navigate To Model Overview App
    When User Adds Additional Dataset To Model
    Then Wait Until Page Contains  Customer service response
