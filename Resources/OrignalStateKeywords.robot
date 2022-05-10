*** Keywords ***


User Adds Additional Dataset To Model
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains   Datasets available to connect
    #Wait Until Page Contains Element  xpath://*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button
    Click element  css : div#app > div.v-dialog__content.v-dialog__content--active > div > div > div > div:nth-child(3) > div > div > div:nth-child(2) > div > div > div > div.v-card__actions > button
    Wait Until Page Contains  Select the column which contains the text

    Scroll Element Into View   //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
    Click element  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
    #Click Element  ${ConnectButton}

