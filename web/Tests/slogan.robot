*** Settings ***
Documentation        Teste para verificar o Slogan da Smarbit na WebApp
Library    Browser

*** Test Cases ***
Deve exibir o slogan na landing page
    New Browser        browser=chromium                     headless=False
    New Page           http://localhost:3000/
    Get Text           css=.headline h2        equal        Sua Jornada Fitness Começa aqui!