*** Settings ***

Documentation  Testsuite Login

Library  SeleniumLibrary

Suite Setup    Begin Web Test
Suite Teardown   End Web Test


*** Variables ***
${BROWSER}  chromeheadless
${URL}  https://app.labelf.ai/login



*** Keywords ***

Begin Web Test
     ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome   '/home/<user>/chromedriver'  chrome_options=${chrome_options}
    Go To    ${URL}
    Wait Until Page Contains  Don't have an account? Sign up
End Web Test
    Close Browser


Navigate To labelf Web Page
    Go To  ${URL}
    Wait Until Page Contains  Don't have an account? Sign up

*** Test Cases ***
Open Web Page And Verify
    [Documentation]
    [Tags]  Smoke
    Navigate To labelf web page
