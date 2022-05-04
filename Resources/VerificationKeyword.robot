*** Keywords ***

User Inputs Test Sentence into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  They always round up tickets for prizes from the "games". I don't think they'd turn a kid away from getting a little something!
    Click Button  ${SubmitButton}


Verify Confidence Is Higher Than 100% When Sum
    ${for_value}=  Get Element count  //div[contains(@class,'v-toolbar__title body-2')]
    log to console  ${for_value}

    #${ISUM} =    set variable  0
    FOR  ${i}  IN RANGE  4  ${for_value}+4
        ${h2text}=  get text  xpath:(//div[contains(@class,'v-toolbar__title body-2')])[${i}]
        #${number only}     Evaluate    "${h2text}".split(" ")[:]
        ${number only}  Remove String  ${h2text}

        #${ISUM} =    Evaluate    int(${ISUM}) + int(${number only})
        log to console  ${number only}
    END


