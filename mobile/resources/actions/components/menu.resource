*** Settings ***
Documentation        Ações e elementos do componente Menu de Navegação
Library              AppiumLibrary

*** Keywords ***
Touch my body
    Click Element    xpath=//*[contains(@text, 'Meu corpo')]

Touch my account
    Click Element    xpath=//*[contains(@text, 'Minha conta')]