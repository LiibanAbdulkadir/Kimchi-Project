*** Keywords ***

User Navigate To Model Overview App 1
    Go To  ${AppWorkspaceModelView}
    Click Element  ${OverviewPrelabledButton}
    Wait Until Page Contains  Overview

User Navigate To Model Overview App 2
    Go To  ${AppWorkspaceModelView}
    Click Element  ${OverviewPrelabledTestButton}
    Wait Until Page Contains  Overview

user Navigate To Model Overview App 4
    Wait Until Page Contains  Models
    Click Element  ${ModelID3085NameButtonInWorkspace}

User Navigate To Model Overview App 3
    Wait Until Page Contains  Team Kimchi
    Click Element  ${ModelID3084NameButtonInWorkspace}
    Wait Until Page Contains Element  ${StartTrainingButton}

User Adds Additional Dataset To Model 2
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Click element  css : div#app > div.v-dialog__content.v-dialog__content--active > div > div > div > div:nth-child(3) > div > div > div:nth-child(2) > div > div > div > div.v-card__actions > button
    Wait Until Page Contains  Select the column which contains the text

    Scroll Element Into View  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
    Click element  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div


Verify “Only one dadaset” should be shown as connected
     Execute Javascript  window.scrollTo(0,850)
     Wait until page contains  Connected Datasets
     Page Should Contain  Customer feedback,Partly pre-labeled60
     ${CountDatasets}=  Get Element count  //span[contains(.,' Disconnect dataset ')]
     #log to console  ${CountDatasets}
     ${CountDatasetsCheckValue} =  set variable  1

     IF  ${CountDatasetsCheckValue} < ${CountDatasets}
     Log to console  More than 1 dataset in model
     Fail
     END


User Disconnects Additional Dataset
      Reload page
      Execute Javascript  window.scrollTo(0,1050)
      Click Element  ${DisconnectButton}

      Wait Until Page Contains Element  ${DisconnectAfirmButton}
      Click Button  ${DisconnectAfirmButton}

Disconnects Dataset for Model 3 and 4
    Go to  https://app.labelf.ai/main/387/models/view
    User Navigate To Model Overview App 3
    Execute Javascript  window.scrollTo(0,1050)
    User Disconnects Additional Dataset

    Go to  https://app.labelf.ai/main/387/models/view
    User Navigate To Model Overview App 4
    Execute Javascript  window.scrollTo(0,1050)
    User Disconnects Additional Dataset

Verify That The Page Is Not In Processing State
    Go to  ${AppWorkspaceModelView}
    Page Should Not Contain  Processing

User Is On Model Overview
    Click element  ${OverviewPrelabledTestButton}

