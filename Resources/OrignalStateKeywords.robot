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

User Adds Additional Dataset To Model
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
      Scroll Element Into View  ${DisconnectButton}
      Click Element  ${DisconnectButton}

      Wait Until Page Contains Element  ${DisconnectAfirmButton}
      Click Button  ${DisconnectAfirmButton}

Disconnects Dataset for Model 3 and 4

    Go to  https://app.labelf.ai/main/387/models/view
    User Navigate To Model Overview App 3
    User Disconnects Additional Dataset
    Reload Page
    Verify “Only one dadaset” should be shown as connected


    Go to  https://app.labelf.ai/main/387/models/view
    User Navigate To Model Overview App 4
    User Disconnects Additional Dataset
    Reload Page
    Verify “Only one dadaset” should be shown as connected

Verify That The Page Is Not In Processing State
    Reload page
    Page Should Not Contain  I'm currently processing your data, come back later!

User Is On Model Overview
    click element  ${CustomerfeedbackModelOverview}

Verify “Only one dadaset” should be shown as connected
     Execute Javascript  window.scrollTo(0,850)
     Wait until page contains  Connected Datasets
     Page Should Contain  Customer feedback,Partly pre-labeled60
     Page Should Not Contain element  ${CustomerServiceResponseDataSet}
