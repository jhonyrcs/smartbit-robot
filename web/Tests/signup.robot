*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot


*** Test Cases ***
Deve iniciar o cadastro do clientes
    [Tags]    smoke
    ${account}         Create Dictionary
    ...    name=Jhony Santos
    ...    email=jhony@email.com
    ...    cpf=04425755138
    
    Delete Account By Email    ${account}[email]
    
    Submit signup form        ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Template]          Attempt signup
    ${EMPTY}            jhony@email.com.br        80683243055        Por favor informe o seu nome completo
    Jhony Santos        ${EMPTY}                  80683243055        Por favor, informe o seu melhor e-mail
    Jhony Santos        jhony@email.com.br        ${EMPTY}           Por favor, informe o seu CPF
    Jhony Santos        jhony*email.com.br        80683243055        Oops! O email informado é inválido 
    Jhony Santos        jhony@email.com.br        8068324305a        Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]        ${name}        ${email}        ${cpf}        ${output_message}
    ${account}         Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    
    Submit signup form      ${account}
    Notice should be        ${output_message}
