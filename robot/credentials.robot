*** Variables ***
${CREDENTIALS_FILE}    /credentials.json

*** Keywords ***
Load Credentials
    ${data}=    Evaluate    json.load(open('${CREDENTIALS_FILE}'))    modules=json
    ${nome}=    Set Variable    ${data['nome']}
    ${senha}=    Set Variable    ${data['senha']}
    RETURN    ${nome}    ${senha}