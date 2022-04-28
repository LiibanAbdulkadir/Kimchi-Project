*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot


Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Model Creation Test

*** Test Cases ***

Slider One Text Can Contain Multiple Labels Is Presented
    [Documentation]  Slider One text can contain multiple labels is presented
    [Tags]  Testcase 1
    Given User Has Selected Bring Your Own Labels
    When User Clicks Continue
    Then The Slider One Text Can Contain Multiple Labels Is Presented
