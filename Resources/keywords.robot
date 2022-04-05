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
    Input Text  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input  kimchitest@hotmail.com
    Input Text  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input  Kimchi123

Press Login Button
    Click Button  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]

Confirm user logged in
    Wait Until Page Contains  My Models

Confirm Cookie
    Sleep  5s
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]

Creat a Model
     Wait Until Page Contains  Models
     sleep  5s
     click element   //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/nav/div[1]/a/div/i
     Wait Until Page Contains  Add a model
     sleep  2s
     click button  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button
     Wait Until Page Contains  Setup
Select an Existing Dataset
     Scroll Element Into View  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]
     sleep  5s
     click button   //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button
     Wait Until Page Contains  Please click on the column
     sleep  5s
     Scroll Element Into View  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
     click button  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
     sleep  5s
Set Name and Description For Model
     Press Keys  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input  CTRL+A+DELETE
     input text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input   Survey Data Model
     sleep  2s
     input text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea  This is A Model
     sleep  5s
     click button  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
     wait until page contains  My Models
Verify your Model Exist
     page should contain   Survey Data Model