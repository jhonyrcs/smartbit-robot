*** Settings ***
Documentation        Ações e elementos da págiina de Login

Library              Browser

Variables            ../Env.py

*** Keywords ***
Go to login page
    Go To        ${BASE_URL}/login

Submit login form
    [Arguments]        ${email}        ${password}

    Fill Text    css=input[name=email]        ${email}
    Fill Text    css=input[name=password]     ${password}
    
    Click        css=button >> text=Entrar