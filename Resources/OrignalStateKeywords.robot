*** Keywords ***


User Adds Additional Dataset To Model
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}

    Wait Until Page Contains Element  xpath://*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button
    Click element  xpath://*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button

    Click Element  ${ConnectButton}

