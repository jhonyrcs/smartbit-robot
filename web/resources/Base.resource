*** Settings ***
Documentation        Arquivo principal do projeto Smartbit-Robot

Library              JSONLibrary
Library              Browser
Library              ../../libs/Account.py
Library              ../../libs/Database.py

Resource             pages/Landing.resource
Resource             pages/Welcome.resource
Resource             pages/Login.resource
Resource             pages/Accounts.resource
Resource             pages/Memberships.resource

Resource             pages/components/Toast.resource
Resource             pages/components/BoxBotice.resource
Resource             pages/components/NavBar.resource
Resource             pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}        sac@smartbit.com
${ADMIN_PASS}         pwd123

*** Keywords ***
Start session
    New Browser        browser=chromium                     headless=False
    New Page           http://localhost:3000/

Get json fixture
    [Arguments]        ${file_name}        ${scenario}
    
    ${data}     Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    RETURN      ${data}[${scenario}]

Sign in admin
    Go to login page
    Submit login form        ${ADMIN_EMAIL}       ${ADMIN_PASS}
    User is logged in        ${ADMIN_EMAIL}