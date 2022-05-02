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
${SliceFakeNews}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(3) > g
${SliceEconomy}   css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(1) > g
${SliceSport}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(2) > g

#Dataset
${DataSelectCustomerSupportButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DataSelectCustomerResponseButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${DataSelectPartlyPreLabledButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${ContinueWithSelectedDatasetColumnButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button


#Label Training
${AddALabelButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div   #Adds new label
${AddLabelButton}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button  #Adds label when you input label Name
${LabelsPieChart}  //*[@id="plotly"]/div[1]/div
${MultipleChoiceButton}  //button[contains(.,'Multiple Choice')]
${AddButton}  //button[contains(.,' Add ')]
${FirstRadioButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
${SecondRadioButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
${ThirdRadioButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[3]
${LabelSwitchButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${MultiplLabelsSwitchButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/nav/div/div[3]/div/div/div[1]/div

#GeneralButtons
${DeleteButton}  //button[contains(.,'Delete')]
${ContinueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button



