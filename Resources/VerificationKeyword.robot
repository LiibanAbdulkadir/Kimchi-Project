*** Keywords ***

User Navigate To Model Overview App 1
    Go To  ${AppWorkspaceModelView}
    Click Element  ${OverviewPrelabledButton}
    Wait Until Page Contains  Overview

User Inputs Test Sentence From Orginal Dataset into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  They always round up tickets for prizes from the "games". I don't think they'd turn a kid away from getting a little something!
    Click Button  ${SubmitButton}

User Inputs New Test Sentence With Multiple Labels into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  The service is bad, but the food is great
    Click Button  ${SubmitButton}

User Inputs confidence levels Sentence matches the label of the original datapoint into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  Do not greet you
    Click Button  ${SubmitButton}

Retrive Confidence Level And Verify Confidence Is Higher Than 100% When Sum
    ${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__title body-2')]
    #log to console  ${ElementCount}

    ${SUM} =  set variable  0

    FOR  ${i}  IN RANGE  4  ${ElementCount}+4
        ${confidenceLevel}=  get text  xpath:(//div[contains(@class,'v-toolbar__title body-2')])[${i}]

        ${OnlyNumber}=    Remove String    ${confidenceLevel}    Confidence:
        ${OnlyNumber}=    Remove String    ${OnlyNumber}  %

        ${SUM1} =    Evaluate    int(${SUM}) + int(${OnlyNumber})
        ${SUM} =  Set variable  ${SUM1}
        #log to console  ${OnlyNumber}
    END
    Log to Console  .
    Log to Console  Precentage sum:
    Log to console  ${SUM}
    ${ControlValue100} =  set variable  100

    IF    ${SUM} < ${ControlValue100}
    Log to console  The precentage is below 100
    Fail
    END


Retrive Confidence Level And Verify that Confidence Is Higher Than 50% When Sum
    ${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__title body-2')]
    FOR  ${i}  IN RANGE  4  ${ElementCount}+1
      ${confidenceLevel}=  get text  xpath:(//div[contains(@class,'v-toolbar__title body-2')])[${i}]
      ${OnlyNumber}=    Remove String    ${confidenceLevel}    Confidence:
      ${OnlyNumber}=    Remove String    ${OnlyNumber}  %

    END
    Log to Console  .
    Log to Console  Confidence Level at:
    Log to Console  ${OnlyNumber}

    ${ControlValue50} =  set variable  50

    IF    ${OnlyNumber} < ${ControlValue50}
    Log to console  The precentage is below 50
    Fail
    END


Confidence levels matches the label of the original datapoint
    #${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__content')]
    #log to console  ${ElementCount}

    ${confidenceRank1}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[10]  #Rank1
    ${confidenceRank1}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[10]  #Two variables share the same xpath position need to run the code twice to Pick the right one!
    ${confidenceRank2}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[11]  #Rank2
    ${confidenceRank3}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[12]  #Rank3
    ${confidenceRank4}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[13]  #Rank4
    Log to console  .
    Log to console  ${confidenceRank4}
    Log to console  ---------
    Log to console  ${confidenceRank3}
    Log to console  ---------
    Log to console  ${confidenceRank2}
    Log to console  ---------
    Log to console  ${confidenceRank1}
    Log to console  ---------

    IF  "Negative" in """${confidenceRank1}"""
        Log to console  Negative is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "Positive" in """${confidenceRank1}"""
        Log to console  Positive is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "Neutral" in """${confidenceRank1}"""
        Log to console  Neutral is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "N/A" in """${confidenceRank1}"""
        Log to console  N/A is the label with the highest confidence level
        Log to console  ---------
    ELSE
        Log to console  ERROR DOES NOT MATCH ANY CONFIDENCELEVEL
        FAIL
    END

user Navigate To Model Overview App 4
    Wait Until Page Contains  Models
    Click Element  ${ModelID3085NameButtonInWorkspace}

User Navigate To Model Overview App 3
    Wait Until Page Contains  Team Kimchi
    Click Element  ${ModelID3084NameButtonInWorkspace}
    Wait Until Page Contains Element  ${StartTrainingButton}

User Connects The New Dataset From The Model Overview
    Execute Javascript  window.scrollTo(0,1000)
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect
    Click Element  ${ContinueButtonDatasetID470}
    Wait Until Page Contains  Select the column which contains the text
    Scroll Element Into View  ${ConnectButton}
    Click element  ${ConnectButton}


Check The Number Of DatPoints Before Adding Additional DataSet
    go to  https://app.labelf.ai/main/387/models/view
    Wait Until Element Is Visible  ${NumberTextBefore}
    ${NumberString}  Get Text  ${NumberTextBefore}
    ${IntbeforeIncrease}  Removetext   ${NumberString}
    Set Global Variable  ${IntbeforeIncrease}

Check The Number Of DatPoints After Adding Additional DataSet
    Wait Until Element Is Visible  ${StringNumberAfterAddDataSet}
    ${NumberString}  Get Text  ${StringNumberAfterAddDataSet}
     ${IntAfterIncrease}  Removetext   ${NumberString}
    Set Global Variable  ${IntAfterIncrease}


Verify That The number of dataPoints in the model is increased
    go to  https://app.labelf.ai/main/387/models/view
    Wait Until Element Is Visible  ${StringNumberAfterAddDataSet}
    Should Be True  ${IntbeforeIncrease} < ${IntAfterIncrease}
    Log to console  ${IntbeforeIncrease} < ${IntAfterIncrease}

User Inputs an example from the first dataset to the test the model
      Input Text  ${InputDescriptionTextField}  known to be rude and unwelcoming
      Click Button  ${SubmitButton}

User Adds A New Additional Dataset To Model
    Scroll Element Into View  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains Element  ${ConnectAddtionalDatasetButton}
    Click Element  ${ConnectAddtionalDatasetButton}
    Wait Until Page Contains Element  ${ContinueButtonDatasetID470}
    Click Element  ${ContinueButtonDatasetID470}
    Wait Until Page Contains Element  ${UseLabelsToContinueToTrainTheModelCheckBox}
    Click Element  ${UseLabelsToContinueToTrainTheModelCheckBox}
    Scroll Element Into View  ${ContinueButtonWhenAddNewDataset}
    Wait Until Page Contains Element  ${ContinueButtonWhenAddNewDataset}
    Click Button  ${ContinueButtonWhenAddNewDataset}
    Wait Until Page Contains Element  ${LabelCheckBoxWhenAddNewDataset}
    Sleep  0.2s
    Click Element  ${LabelCheckBoxWhenAddNewDataset}
    Scroll Element Into View  ${ConnectButtonWhenAddNewDataset}
    Sleep  0.2s
    Wait Until Page Contains Element  ${ConnectButtonWhenAddNewDataset}
    Click Element  ${ConnectButtonWhenAddNewDataset}
    Page Should Contain  Second multilabeled dataset


Verify That The Model Is In Processing State
    Scroll Element Into View  ${StartTrainingButton}
    Wait Until Page Contains Element  ${ModelsButtonInMainBar}
    Click Element  ${ModelsButtonInMainBar}
    Wait Until Page Contains  Team Kimchi
    Page Should Contain  Processing