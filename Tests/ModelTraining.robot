*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot


Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Model Creation Test

*** Test Cases ***

slider One text can contain multiple labels is presented
    [Documentation]  slider One text can contain multiple labels is presented
    [Tags]  Testcase
    Given User Has selected Bring your own labels
    When user clicks continue
    Then the slider One text can contain multiple labels is presented
