*** Keywords ***

User Inputs Test Sentence into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  They always round up tickets for prizes from the "games". I don't think they'd turn a kid away from getting a little something!
    Click Button  ${SubmitButton}


Verify Confidence Is Higher Than 100% When Sum
    ${for_value1}=  Get Element Attribute  //*[contains(@role,'progressbar')]  aria-valuenow
    Log To Console  ${for_value1}


