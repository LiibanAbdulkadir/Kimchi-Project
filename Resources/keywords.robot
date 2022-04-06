*** Keywords ***

Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}

End Web Test
    Close Browser

Input User Credential
    Go To  ${URL}
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input  kimchitest@hotmail.com
    Input Text  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input  Kimchi123

Press Login Button
    Click Button  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]

Confirm user logged in
    Wait Until Page Contains  My Models

Confirm Cookie
    Sleep  5s
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]