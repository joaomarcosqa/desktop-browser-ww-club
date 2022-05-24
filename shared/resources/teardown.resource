***Settings***
Library    SeleniumLibrary
Library    ../libs/UtilsLib.py

Variables    ../../config.py

***Keywords***
Close website
    ${datacurrent}             Get Current Date
    Capture Page Screenshot    ${datacurrent}-test-evidence-.png
    Close Browser
