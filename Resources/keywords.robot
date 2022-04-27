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

User Clicks Button "New Model" And To Create A New Model From Scratch
     Wait Until Page Contains Element  ${NewModelButton}
     Sleep  0.2
     Click Element   ${NewModelButton}
     Wait Until Page Contains  Add a model
     Click Button  ${ContinueCreateModelButton}
     Wait Until Page Contains  Setup

Select An Existing Dataset
     Scroll Element Into View   ${DataSelectCustomerSupportButton}
     Sleep  0.2
     Click Element   ${DataSelectCustomerSupportButton}
     Wait Until Page Contains  Please click on the column
     Wait Until Page Contains Element  ${ContinueWithSelectedDatasetColumnButton}
     Sleep  0.2  # To allow time for page animation
     Click Element  ${ContinueWithSelectedDatasetColumnButton}

Select Costumer Service Response as Dataset
     Scroll Element Into View   ${DataSelectCustomerResponseButton}
     Sleep  0.2
     Click Element   ${DataSelectCustomerResponseButton}
     Wait Until Page Contains  Please click on the column

     Wait Until Page Contains Element  ${ContinueWithSelectedDatasetColumnButton}
     Sleep  0.2  # To allow time for page animation
     Click Element  ${ContinueWithSelectedDatasetColumnButton}

Set A Name And Description For Model
     Press Keys  ${InputNameTextField}  CTRL+A+DELETE
     Input Text  ${InputNameTextField}   ${ModelName}
     Input Text   ${InputDescriptiontextField}  ${ModelDescription}
     Click Button  ${CreateModelButton}
     Wait Until Page Contains  My Models

Model Is Created On Workspace
     Page Should Contain   ${ModelName}

Model Description Is Presented In Model Overview
    Page Should Contain  ${ModelDescription}

Open Top Burger Drop Down Menu
    Wait Until Page Contains Element  ${WorkspaceDropdownMenu}
    Click Element  ${WorkspaceDropdownMenu}

Navigate to Workspace 60
    Wait Until Page Contains Element  //*[@href="/main/60/models/view"]
    Wait until Page Contains  Team Kimchi
    Click Element  //*[@href="/main/60/models/view"]
    Wait Until Location Is  ${StagWorkspaceModelView}

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

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${DeleteOption}
    Click Element  ${DeleteOption}
    Wait Until Page Contains Element  ${DeleteButton}
    Click Button  ${DeleteButton}

Workspace Is Empty
    Wait Until Page Contains  My Models (0)


User Clicks Button "Overview" And "Start Training" And "Add a label"
    Wait Until Page Contains Element  ${OverviewButton}
    Click Element  ${OverviewButton}

    Wait Until Page Contains Element  ${StartTrainingButton}
    Click Element  ${StartTrainingButton}

    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element  ${AddALabelButton}
    Click Element  ${AddALabelButton}

Input Label Name And Click Add label
    Input Text  ${InputNameTextField}  Sport
    Click Element  ${AddLabelButton}
    Wait until page contains  You must add at least two labels before Labelf can start learning!

    Click element  xpath://span[contains(text(),'Add a label')]

    Press Keys  ${InputNameTextField}  CTRL+A+DELETE
    Input Text  ${InputNameTextField}  Economy
    Click element  //button[contains(.,'Add label')]

Multiple Choice Is Provided As Option
    Wait Until Page Contains Element  ${MultipleChoiceButton}
    Wait Until Page Contains  Multiple Choice

Multiple Choice Is Selected
    Click Element  ${MultipleChoiceButton}

Radio Buttons For Created Labels Is Shown
    Wait Until Page Contains  Sport
    Wait Until Page Contains  Economy

Model Is Trained with MultipleLables
    Wait until Page Contains  Lets start by giving Labelf 20 samples
    Page Should Contain Element  //div[contains(text(),'Sport')]
    Click Element  ${SportRadioButton}
    Click Button  ${AddButton}
    Wait until Page Contains  Lets start by giving Labelf 19 samples
    Page Should Contain Element  //div[contains(text(),'Economy')]
    Click Element  ${EconomyRadioButton}
    Click Button  ${AddButton}
    Wait until Page Contains  Lets start by giving Labelf 18 samples
    Page Should Contain Element  //div[contains(text(),'Economy')]
    Page Should Contain Element  //div[contains(text(),'Sport')]
    Click Element  ${SportRadioButton}
    Click Element  ${EconomyRadioButton}
    Click Button  ${AddButton}

    Go To  ${StagWorkspaceModelView}
    Click Element  ${OverviewButton}

Verify MultipleLabels Are Shown In Report
A Third Label Is Added To Model
    Click element  xpath://span[contains(text(),'Add a label')]
    Press Keys  //input[contains(@aria-label,'Name*')]  CTRL+A+DELETE
    Input Text  //input[contains(@aria-label,'Name*')]  Fake News
    Click element  //button[contains(.,'Add label')]

All Labels Are Possible To Select
    Wait until Page Contains  Lets start by giving Labelf 17 samples
    Page should contain Element  //div[contains(text(),'Fake News')]
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
    Page should contain Element  //div[contains(text(),'Sport')]
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[3]
    Page should contain Element   //div[contains(text(),'Economy')]
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
    Click Element  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[3]
    Click Button  //button[contains(.,' Add ')]

That Model Is Trained With Three Labels
    Wait until Page Contains  Lets start by giving Labelf 16 samples

User Navigate To Model Overview
    Go To   ${StagWorkspaceModelView}
    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
    Wait Until Page Contains  Overview


The Trained Labels Are Shown In Report
    Scroll Element Into View  //*[contains(text(),'Connected Datasets')]
    Wait Until Page Contains  Sport
    Wait Until Page Contains  Economy
    Wait Until Page Contains  Fake News
    Execute Javascript  window.scrollTo(0,1800)
    Wait Until Element Is Visible   ${LabelsPieChart}
    Wait Until Element contains  ${SliceEconomy}  50%
    Wait Until Element contains  ${SliceSport}  33.3%
    Wait Until Element contains  ${SliceFakeNews}  16.7%


