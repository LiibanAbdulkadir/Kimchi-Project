*** Variables ***

# URL:s
${AppLoginSite}  https://app.labelf.ai/login
${StagLoginSite}  https://stag.labelf.ai/login

${AppWorkspaceModelView}  https://app.labelf.ai/main/387/models/view
${StagWorkspaceModelView}  https://stag.labelf.ai/main/60/models/view

${LoginEmailField}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${LoginPasswordField}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input
${Email}  kimchitest@hotmail.com
${Password}  Kimchi123
${LoginButton}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${ConfirmCookieButton}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
${TopBurgerDropDownMenu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]
${NewModelButton}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${ContinueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button
${DataSelectButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DataSelectButton2}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${ChooseExistingDataSetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button
${ContinueColumnButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${ScrollTillContinueColumnButton}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]
${InputNameTextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ModelName}   Data Model
${InputDescriptionTextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea
${ModelDescription}  This is A Model
${CreateModelButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
${SingleModelOptionsButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${DeleteOption}  //*[@class="v-icon icon-menu-danger material-icons theme--light"]
${StartTrainingButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${OverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${AddALabelButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${AddLabelButton}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button
