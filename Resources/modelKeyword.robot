*** Keywords ***


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

Navigate to Workspace 387
    Go to  https://app.labelf.ai/main/387/models/view


Navigate to Workspace 60
    Wait Until Page Contains Element  //*[@href="/main/60/models/view"]
    Wait until Page Contains  Team Kimchi
    Click Element  //*[@href="/main/60/models/view"]
    Wait Until Location Is  ${StagWorkspaceModelView}

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
    Click Element  ${SecondRadioButton}
    Click Button  ${AddButton}
    Wait until Page Contains  Lets start by giving Labelf 19 samples
    Page Should Contain Element  //div[contains(text(),'Economy')]
    Click Element  ${FirstRadioButton}
    Click Button  ${AddButton}
    Wait until Page Contains  Lets start by giving Labelf 18 samples
    Page Should Contain Element  //div[contains(text(),'Economy')]
    Page Should Contain Element  //div[contains(text(),'Sport')]
    Click Element  ${FirstRadioButton}
    Click Element  ${SecondRadioButton}
    Click Button  ${AddButton}

A Third Label Is Added To Model
    Click element  xpath://span[contains(text(),'Add a label')]
    Press Keys  //input[contains(@aria-label,'Name*')]  CTRL+A+DELETE
    Input Text  //input[contains(@aria-label,'Name*')]  Fake News
    Click element  //button[contains(.,'Add label')]

All Labels Are Possible To Select
    Wait until Page Contains  Lets start by giving Labelf 17 samples
    Page should contain Element  //div[contains(text(),'Economy')]
    Page should contain Element  //div[contains(text(),'Fake News')]
    Page should contain Element  //div[contains(text(),'Sport')]
    Click Element  ${FirstRadioButton}
    Click Element  ${SecondRadioButton}
    Click Element  ${ThirdRadioButton}
    Click Element  ${ThirdRadioButton}
    Click Button  ${AddButton}

That Model Is Trained With Three Labels
    Wait until Page Contains  Lets start by giving Labelf 16 samples

User Navigate To Model Overview App
    Go To  ${AppWorkspaceModelView}
    Click Element  ${OverviewButton}
    Wait Until Page Contains  Overview

User Navigate To Model Overview
    Go To   ${StagWorkspaceModelView}
    Click Element  ${OverviewButton}
    Wait Until Page Contains  Overview

The Trained Labels Are Shown In Report
    Scroll Element Into View  //*[contains(text(),'Connected Datasets')]
    Wait Until Page Contains  Sport
    Wait Until Page Contains  Economy
    Wait Until Page Contains  Fake News
    Execute Javascript  window.scrollTo(0,1800)
    Wait Until Element Is Visible   ${LabelsPieChart}
    Wait Until Element contains  ${SliceEconomy}  50
    Wait Until Element contains  ${SliceSport}  33.3
    Wait Until Element contains  ${SliceFakeNews}  16.7

User Has Selected Bring Your Own Labels
    Go To  ${StagLoginSite}
    Input User Credential
    Confirm Cookie
    Press Login Button
    Confirm User Logged In
    Go To  ${StagWorkspaceModelView}
    User Clicks Button "New Model" And To Create A New Model From Scratch
    Click Element  ${DataSelectPartlyPreLabledButton}
    Wait Until Page Contains  Please click on the column
    Click Element  ${LabelSwitchButton}

User Clicks Continue
     Wait Until Page Contains Element  ${ContinueWithSelectedDatasetColumnButton}
     Sleep  0.2  # To allow time for page animation
     Click Element  ${ContinueWithSelectedDatasetColumnButton}
     Wait Until Page Contains  Please click on the column containing the labels

The Slider "One Text Can Contain Multiple Labels" Is Presented
     Wait Until Page Contains Element  ${MultiplLabelsSwitchButton}

Verify "One Text Can Have Multiple Labels" Is Enabled When Clicked
     Click Element  ${MultiplLabelsSwitchButton}
     Element Should Be Enabled  ${MultiplLabelsSwitchButton}

Verify that all labels from original dataset are shown in Model overview
     Wait Until Page Contains  Negative
     Wait Until Page Contains  Positive
     Wait Until Page Contains  Neutral
     Wait Until Page Contains  N/A
