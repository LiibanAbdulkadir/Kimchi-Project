*** Keywords ***


Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    call Method    ${chrome_options}    add_argument  --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless  # Comment away to capture video
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome_options}

    Set Window Size  ${1600}  ${1050}
    Set Selenium speed  0.3  # Set to 0.5 for video capture of test suite

End Web Test
    Close Browser

End Model Creation Test
    Delete Single Automated Test Model
    Close Browser

Input User Credential
    Go To  ${StagLoginSite}
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${LoginEmailField}  ${Email}
    Input Text    ${LoginPasswordField}  ${Password}

Confirm Cookie
    Sleep  0.2
    Click Button  ${ConfirmCookieButton}

Press Login Button
    Click Button  ${LoginButton}

Confirm User Logged In
    Wait Until Page Contains  My Models

User Is Logged In And On An Empty Workspace
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (0)

Delete Single Automated Test Model
    User Is Logged In And On An Workspace Containing One Model
    User Opens Single Model Options Dropdown List
    User Clicks Delete Model Option
    Workspace Is Empty

User Is Logged In And On An Workspace Containing One Model
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (1)

User Opens Single Model Options Dropdown List
    Wait Until Page Contains Element  ${SingleModelOptionsButton}
    Click Element  ${SingleModelOptionsButton}

Workspace Is Empty
    Wait Until Page Contains  My Models (0)

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${DeleteOption}
    Click Element  ${DeleteOption}
    Wait Until Page Contains Element  ${DeleteButton}
    Click Button  ${DeleteButton}


