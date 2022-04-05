*** Variables ***

${Login e-mail field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${Login password field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input
${E-mail}  kimchitest@hotmail.com
${Password}  Kimchi123
${Login button}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${Confirm cookie button}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
${Top burger drop down menu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]


*** Keywords ***

Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    #Open Browser  about:blank  ${BROWSER}
    #Set Window Size  ${2000}  ${2000}

End Web Test
    Close Browser

Input User Credential
    Go To  ${URL}
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${Login e-mail field}  ${E-mail}
    Input Text    ${Login password field}  ${Password}

Press Login Button
    Click Button  ${Login button}

Confirm user logged in
    Sleep  3s
    Wait Until Page Contains  My Models

Confirm Cookie
    Sleep  3s
    Click Button  ${Confirm cookie button}

Open top burger drop down menu
    wait until page contains element  ${Top burger drop down menu}
    Click Element  ${Top burger drop down menu}

Navigate to Workspace 387
    wait until page contains element  //*[@href="/main/387/models/view"]
    Click element  //*[@href="/main/387/models/view"]
    Wait Until Location Is  https://app.labelf.ai/main/387/models/view

