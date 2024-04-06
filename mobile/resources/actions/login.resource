*** Settings ***
Documentation        Ações e elementos da tela de login
Library              AppiumLibrary

*** Keywords ***
Signin with document
    [Arguments]        ${cpf}
    Input Text           xpath=//*[@resource-id='ipAddress']    172.24.32.1
    Input Text           xpath=//*[@resource-id='cpf']          ${cpf}
    Click Element        xpath=//*[contains(@text, 'Entrar')]