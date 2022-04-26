*** Variables ***

# URL:s Menu
${StagLoginSite}  https://stag.labelf.ai/login
${WorkspaceDropdownMenu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]

# Login
${LoginEmailField}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${Email}  kimchitest@hotmail.com
${LoginPasswordField}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input
${Password}  Kimchi123
${LoginButton}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${ConfirmCookieButton}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]


# Workspace
${StagWorkspaceModelView}  https://stag.labelf.ai/main/60/models/view
${SingleModelOptionsButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${OverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${NewModelButton}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${DeleteOption}  //*[@class="v-icon icon-menu-danger material-icons theme--light"]


# Model
${ContinueCreateModelButton}  //button[contains(.,'Continue')]
${InputNameTextField}  //input[contains(@aria-label,'Name*')]
${ModelName}   Data Model
${InputDescriptionTextField}  //*[@name="input-7-1"]
${ModelDescription}  This is A Model
${CreateModelButton}  //button[contains(.,'Create Model')]
${StartTrainingButton}  //*[contains(text(),'model_training')]


#Dataset
${DataSelectButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DataSelectButton2}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${ChooseExistingDataSetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button
${ContinueColumnButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${ScrollTillContinueColumnButton}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]


#Label Training
${AddALabelButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${AddLabelButton}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button
${FirstRadioRoundButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]/a/div[1]/i
${SecondRadioRoundButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]/a/div[1]/i
${FirstRadioFullButton}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
${SecondRadioFullButton}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
${FirstRadioNameButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]/a/div[2]/div
${SecondRadioNameButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]/a/div[2]/div
${AddTrainButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/button/div/i
${'X'ExitButton}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${LabelsBarChart}  //*[@id="plotly"]/div[1]/div
${LabelsPieChart}  //*[@id="plotly"]/div[1]/div

