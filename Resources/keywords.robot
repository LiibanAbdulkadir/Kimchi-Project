*** Variables ***

${Login e-mail field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${Login password field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input
${E-mail}  kimchitest@hotmail.com
${Password}  Kimchi123
${Login button}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${Confirm cookie button}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
${Top burger drop down menu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]
${+ModelButton}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${continueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button
${DataSelectButton}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button

${chooseExistingDataSetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button
${ContinueColumnButton}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${ScrollTillContinueColumnButton}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]
${inputNametextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${modelName}   Data Model
${inputDescriptiontextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea
${modelDescription}  This is A Model
${createModelButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button


*** Keywords ***

Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}

End Web Test
    Close Browser

Input User Credential
    Go To  ${URL}
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${Login e-mail field}  ${E-mail}
    Input Text    ${Login password field}  ${Password}

Press Login Button
    Click Button  ${Login button}

Confirm user logged in
    Wait Until Page Contains  My Models

Confirm Cookie
    Sleep  5s
    Click Button  ${Confirm cookie button}

Creat a Model
     Wait Until Page Contains  Models
     click element   ${+ModelButton}
     Wait Until Page Contains  Add a model

     click button  ${continueButton}

     Wait Until Page Contains  Setup
Select an Existing Dataset
     Scroll Element Into View   ${DataSelectButton}

     click button   ${DataSelectButton}
     sleep  3s
     Wait Until Page Contains  Please click on the column

     Scroll Element Into View  ${ScrollTillContinueColumnButton}

     click button  ${ContinueColumnButton}

Set Name and Description For Model
     Press Keys  ${inputNametextField}  CTRL+A+DELETE
     input text  ${inputNametextField}   ${modelName}

     input text   ${inputDescriptiontextField}  ${modelDescription}

     click button  ${createModelButton}
     sleep  3s
     wait until page contains  My Models
Verify your Model Exist
     page should contain   Survey Data Model



Open top burger drop down menu
    wait until page contains element  ${Top burger drop down menu}
    Click Element  ${Top burger drop down menu}

Navigate to Workspace 387
    wait until page contains element  //*[@href="/main/387/models/view"]
    Click element  //*[@href="/main/387/models/view"]
    Wait Until Location Is  https://app.labelf.ai/main/387/models/view

