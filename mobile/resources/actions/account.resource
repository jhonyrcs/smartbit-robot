*** Settings ***
Documentation        Ações e elementos da tela Minha Contains
Library              AppiumLibrary


*** Keywords ***
User is logged in
    ${element}        Set Variable        xpath=//*[contains(@text, 'Sua transformação começa aqui!')]

    Wait Until Element Is Visible         ${element}        10
    Element Text Should Be                ${element}        Sua transformação começa aqui!