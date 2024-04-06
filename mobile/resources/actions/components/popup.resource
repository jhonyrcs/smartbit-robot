*** Settings ***
Documentation        Ações e elementos do componente Pop-up
Library              AppiumLibrary

*** Keywords ***
Popup have text
    [Arguments]        ${target}
    
    ${element}         Set Variable        xpath=//*[@resource-id='android:id/message']

    Wait Until Element Is Visible          ${element}        10
    Element Text Should Be                 ${element}        ${target}