*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/keywords.robot
Library  SeleniumLibrary

Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}  https://app.labelf.ai/login
${SingleModelOptionsButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${DeleteOption}  //*[@id="app"]/div[3]/div/div/div[2]/a/div[1]/div
*** Test Cases ***

User login to Labelf
    [Documentation]  Testcase for user login to labelf
    [Tags]  Testcase 1
    Given input user credential
          Confirm Cookie
    When press login button
    Then Confirm user logged in
