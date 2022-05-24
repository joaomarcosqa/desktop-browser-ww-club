***Settings***
Library      SeleniumLibrary
Variables    ../locators/login_locators.py

***Keywords***
Click and Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                                  30
    ${pos}                           Get Vertical Position                          ${identifier}
    Execute Javascript               window.scrollTo(0, window.scrollY + ${pos})
    Click Element                    ${identifier}                                  

Login
    [Arguments]                      ${identifier}             ${password}      
    Wait Until Element Is Visible    ${identifierTextField}    30
    Input Text                       ${identifierTextField}    ${identifier}
    Wait Until Element Is Visible    ${passwordTextField}      30
    Input Text                       ${passwordTextField}      ${password} 
    Wait Until Element Is Visible    ${passwordTextField} 
    Click Element                    ${buttonLogin}
