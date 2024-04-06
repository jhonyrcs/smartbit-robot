*** Settings ***
Documentation        Suíte de testes de login
Library              AppiumLibrary

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve logar com CPF e IP
    [Tags]    smoke

    ${data}        Get json fixture    login
    Insert Membership       ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in

Não deve logar com CPF não cadastrado
    [Tags]    smoke1
    Signin with document    34277187510
    Popup have text        Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com CPF com dígito inválido
    [Tags]    smoke1
    Signin with document    000000444777
    Popup have text        CPF inválido, tente novamente