*** Keywords ***

User Navigate To Model Overview App 2
    Go To  ${AppWorkspaceModelView}
    Click Element  ${OverviewPrelabledTestButton}
    Wait Until Page Contains  Overview

User Adds Additional Dataset To Model
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Click element  css : div#app > div.v-dialog__content.v-dialog__content--active > div > div > div > div:nth-child(3) > div > div > div:nth-child(2) > div > div > div > div.v-card__actions > button
    Wait Until Page Contains  Select the column which contains the text

    Scroll Element Into View  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
    Click element  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div

User Disconnects Additional Dataset
      Scroll Element Into View  ${DisconnectButton}
      Click Element  ${DisconnectButton}

      Wait Until Page Contains Element  ${DisconnectAfirmButton}
      Click Button  ${DisconnectAfirmButton}


Verify That The Page Is Not In Processing State
    Reload page
    Page Should Not Contain  I'm currently processing your data, come back later!