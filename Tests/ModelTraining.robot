*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot


Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Test Cases ***

Slider "One Text Can Contain Multiple Labels" Is Presented And Enabled When Clicked
    [Documentation]  Slider One text can contain multiple labels is presented And Enabled When Clicked
    [Tags]  Testcase 1
    Given User Has Selected Bring Your Own Labels
    When User Clicks Continue
    Then The Slider "One Text Can Contain Multiple Labels" Is Presented
    And Verify "One Text Can Have Multiple Labels" Is Enabled When Clicked


All Labels From Original Dataset Are Shown In Model Overview
    [Documentation]  When user creates model all labels from original dataset are shown in Model overview
    [Tags]  Testcase 2
    Given Click Element  ${ContinueButton}
          Set A Name And Description For Model
    When User Navigate To Model Overview
    Then Verify that all labels from original dataset are shown in Model overview