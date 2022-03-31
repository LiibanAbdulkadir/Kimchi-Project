*** Keywords ***

Begin Web Test
    Open browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

Navigate To labelf Web Page
    Go To  ${URL}
    Wait Until Page Contains  Don't have an account? Sign up