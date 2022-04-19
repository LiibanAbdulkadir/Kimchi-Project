
*** Keywords ***

Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless  # Comment away to capture video
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Create Webdriver    Chrome    chrome_options=${chrome_options}

    #Maximize Browser Window  # Set for video capture of test suite
    #Set Selenium speed  0.5  # Set for video capture of test suite

End Web Test
    Close Browser

Input User Credential
    Go To  ${StagLoginSite}
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${LoginEmailField}  ${Email}
    Input Text    ${LoginPasswordField}  ${Password}

Press Login Button
    Click Button  ${LoginButton}

Confirm User Logged In
    Wait Until Page Contains  My Models

Confirm Cookie
    Sleep  1s
    Click Button  ${ConfirmCookieButton}

User Clicks Button "New Model" And To Create A New Model From Scratch
     Wait Until Page Contains Element  ${NewModelButton}
     Sleep  0.3
     Click Element   ${NewModelButton}
     Wait Until Page Contains  Add a model
     Click Button  ${ContinueButton}
     Wait Until Page Contains  Setup

Select An Existing Dataset
     Scroll Element Into View   ${DataSelectButton}
     Sleep  0.2
     Click Element   ${DataSelectButton}
     Wait Until Page Contains  Please click on the column
     #Scroll Element Into View  ${ContinueColumnButton}

     Wait Until Page Contains Element  ${ContinueColumnButton}
     Sleep  0.4  # To allow time for page animation
     Click Element  ${ContinueColumnButton}

Set A Name And Description For Model
     Press Keys  ${InputNameTextField}  CTRL+A+DELETE
     Input Text  ${InputNameTextField}   ${ModelName}
     Input Text   ${InputDescriptiontextField}  ${ModelDescription}
     Click Button  ${CreateModelButton}
     Wait Until Page Contains  My Models

Model Is Created On Workspace
     Page Should Contain   ${ModelName}

Open Top Burger Drop Down Menu
    Wait Until Page Contains Element  ${TopBurgerDropDownMenu}
    Click Element  ${TopBurgerDropDownMenu}

Navigate to Workspace 387
    Wait Until Page Contains Element  //*[@href="/main/60/models/view"]
    Wait until Page Contains  Team Kimchi
    Click Element  //*[@href="/main/60/models/view"]
    Wait Until Location Is  ${StagWorkspaceModelView}

User Opens Single Model Options Dropdown List
    Click Element  ${SingleModelOptionsButton}

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${DeleteOption}
    Click Element  ${DeleteOption}
    Wait Until Page Contains Element  //*[@id="app"]/div[6]/div/div/div[3]/button
    Click Button  //*[@id="app"]/div[6]/div/div/div[3]/button

Workspace Is Empty
    Wait Until Page Contains  My Models (0)

User Is Logged In And On An Workspace Containing One Model
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (1)

User Is Logged In And On An Empty Workspace
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (0)