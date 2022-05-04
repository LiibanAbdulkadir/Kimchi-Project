*** Keywords ***

User Inputs Test Sentence From Orginal Dataset into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  They always round up tickets for prizes from the "games". I don't think they'd turn a kid away from getting a little something!
    Click Button  ${SubmitButton}

User Inputs New Test Sentence With Multiple Labels into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  The service is bad, but the food is great
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