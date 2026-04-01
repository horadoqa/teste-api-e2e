*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    OperatingSystem
Suite Setup    Setup Suite

*** Variables ***
${ENDPOINT}       /usuarios
${BROWSER}        headlesschrome
# ${BROWSER}        chrome

*** Keywords ***
Setup Suite
    Load Credentials
    Health Check API
    Health Check Front

Load Credentials
    ${data}=    Load JSON From File    ../credentials.json
    Set Suite Variable    ${NOME}        ${data['nome']}
    Set Suite Variable    ${SENHA}       ${data['senha']}
    Set Suite Variable    ${API_URL}     ${data['url_api']}
    Set Suite Variable    ${FRONT_URL}   ${data['url_fe']}

Health Check API
    Create Session    serverest    ${API_URL}    verify=True
    ${response}=      GET On Session    serverest    ${ENDPOINT}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    API disponível com status ${response.status_code}

Health Check Front
    Create Session    frontend    ${FRONT_URL}    verify=True
    ${response}=      GET On Session    frontend    /
    Should Be Equal As Integers    ${response.status_code}    200

Generate Unique Email
    ${timestamp}=    Get Time    epoch
    ${email}=        Set Variable    horadoqa_${timestamp}@qa.com
    RETURN        ${email}

Open Cadastro Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Evaluate    setattr(options, 'binary_location', '/usr/bin/chromium-browser')    options=${options}
    Open Browser    ${FRONT_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window

Fill Cadastro Form
    [Arguments]    ${nome}    ${email}    ${senha}
    Input Text     name=nome      ${nome}
    Input Text     name=email     ${email}
    Input Text     name=password  ${senha}
    Click Element  css=input[type="checkbox"]
    Click Button   css=button[type="submit"]

Validate Success Message
    Wait Until Location Contains    /admin/home    timeout=30s
    Wait Until Element Is Visible   css=p.lead     timeout=30s
    Element Should Contain          css=p.lead     Este é seu sistema para administrar seu ecommerce.

*** Test Cases ***
Deve Cadastrar Um Novo Usuário Com Sucesso
    ${email}=    Generate Unique Email
    Open Cadastro Page
    Fill Cadastro Form    ${NOME}    ${email}    ${SENHA}
    Validate Success Message
    Close Browser