*** Settings ***
Documentation        Suite de testes de adesões de planos

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão   
    ${data}    Get json fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Acount              ${data}[account]
    
    Sign in admin
    Go to memberships
    Create new membership    ${data}
    Toast should be    Matrícula cadastrada com sucesso.

Não deve realizar adesão duplicada
    ${data}    Get json fixture    memberships    duplicate
    
    Insert membership         ${data}

    Sign in admin
    Go to memberships 
    Create new membership     ${data}
    Toast should be           O usuário já possui matrícula.

Deve buscar por nome
    ${data}        Get json fixture    memberships    search
    
    Insert membership         ${data}

    Sign in admin
    Go to memberships
    Search by name            ${data}[account][name]
    Should filter by name     ${data}[account][name]


Deve excluir uma matrícula
    ${data}        Get json fixture    memberships    remove
    
    Insert membership         ${data}

    Sign in admin
    Go to memberships
    Request removal    ${data}[account][name]
    Confirm removal
    membership should be not be visible    ${data}[account][name]