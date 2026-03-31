*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Suite Setup       Health Check API

*** Variables ***
${API_URL}        https://serverest.dev
${ENDPOINT}       /usuarios
${FRONT_URL}      https://front.serverest.dev/cadastrarusuarios
${BROWSER}        Chrome

*** Keywords ***
Health Check API
    Create Session    serverest    ${API_URL}    verify=True
    ${response}=      GET On Session    serverest    ${ENDPOINT}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    API disponível com status ${response.status_code}

Generate Unique Email
    ${timestamp}=    Get Time    epoch
    ${email}=        Set Variable    horadoqa_${timestamp}@qa.com
    RETURN        ${email}

Open Cadastro Page
    Open Browser    ${FRONT_URL}    ${BROWSER}
    Maximize Browser Window

Fill Cadastro Form
    [Arguments]    ${nome}    ${email}    ${senha}
    Input Text     name=nome      ${nome}
    Input Text     name=email     ${email}
    Input Text     name=password  ${senha}
    Click Element  css=input[type="checkbox"]
    Click Button   css=button[type="submit"]

Validate Success Message
    Page Should Contain    Cadastro realizado com sucesso

*** Test Cases ***
Deve Cadastrar Um Novo Usuário Com Sucesso
    ${email}=    Generate Unique Email
    Open Cadastro Page
    Fill Cadastro Form    Hora do QA    ${email}    1q2w3e4r
    # Validate Success Message
    Close Browser