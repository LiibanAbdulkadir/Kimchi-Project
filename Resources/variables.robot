*** Variables ***

# URL:s Menu
${StagLoginSite}  https://stag.labelf.ai/login
${AppLoginSite}  https://app.labelf.ai/login
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
${AppWorkspaceModelView}  https://app.labelf.ai/main/387/models/view
${SingleModelOptionsButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${OverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${OverviewPrelabledButton}  //*[contains(@href,'/main/387/models/3082/dashboard/dashboard')]
${OverviewPrelabledTestButton}  //*[contains(@href,'/main/387/models/3049/dashboard/dashboard')]
${NewModelButton}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${DeleteOption}  //*[@class="v-icon icon-menu-danger material-icons theme--light"]
${ModelID3084NameButtonInWorkspace}  //*[contains(@href,'/main/387/models/3084/dashboard/dashboard')]
${ModelsButtonInMainBar}  //*[@id="models-button-navbar"]/div

# Model
${ContinueCreateModelButton}  //button[contains(.,'Continue')]
${InputNameTextField}  //input[contains(@aria-label,'Name*')]
${ModelName}  Data Model
${InputDescriptionTextField}  //*[@name="input-7-1"]
${ModelDescription}  This is A Model
${CreateModelButton}  //button[contains(.,'Create Model')]
${StartTrainingButton}  //*[contains(text(),' Start training ')]
${SliceFakeNews}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(3) > g
${SliceEconomy}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(1) > g
${SliceSport}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(2) > g

#Dataset
${DataSelectCustomerSupportButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DataSelectCustomerResponseButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${DataSelectPartlyPreLabledButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${ContinueWithSelectedDatasetColumnButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${UseLabelsToContinueToTrainTheModelCheckBox}  //*[contains(text(),'Use labels to continue to train the model')]
${ContinueButtonWhenAddNewDataset}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button
${LabelCheckBoxWhenAddNewDataset}  //*[@id="app"]/div[4]/div/div/div/div[6]/div/div/div[1]/div/table/thead/tr[1]/th[3]
${ConnectButtonWhenAddNewDataset}  //*[@id="connect-button"]
${ContinueButtonDatasetID470}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button
${ConnectAddtionalDatasetButton}  //*[contains(text(),' Connect additional datasets ')]
${ConnectButton}  //*[contains(text(),' Connect ')]
${DisconnectButton}  //span[contains(.,' Disconnect dataset ')]
${DisconnectAfirmButton}  //Button[contains(.,' Disconnect ')]



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
${SubmitButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${ContinueGenralButton}  //*[contains(.,'Continue')]


#ExtendModelVerification
${ModelID3085NameButtonInWorkspace}  //*[contains(@href,'/main/387/models/3085/dashboard/dashboard')]
${StringNumberAfter}   //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[2]
${StringNumberAfterAddDataSet}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[3]
${CustomerServiceResponseDataSet}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div[2]/div/div/div[1]
${NumberTextBefore}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[3]/div/div/div/nav/div/span[2]