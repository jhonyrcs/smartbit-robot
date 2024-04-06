*** Settings ***
Documentation        Ações e elementos da  tela de Envio de medidas
Library              AppiumLibrary

*** Keywords ***
Send weight and height
    [Arguments]        ${account}
    
    Wait Until Page Contains    Registre ou atualize suas medidas    10

    Input Text    xpath=//*[@resource-id='weight']    ${account}[weight]
    Input Text    xpath=//*[@resource-id='height']    ${account}[height]
    Click Element    xpath=//*[contains(@text, 'Enviar minhas medidas')]