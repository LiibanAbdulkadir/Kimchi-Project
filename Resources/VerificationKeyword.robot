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

