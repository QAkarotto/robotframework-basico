*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***

Criar Sessão na ServeRest
    ${headers}    Create Dictionary
    ...           accept=application/json
    ...           Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev

Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}

Cadastrar o usuário criado na ServeRest
    ${body}    Create Dictionary    
    ...        nome=Fulano da Silva    
    ...        email=${EMAIL_TESTE}    
    ...        password=1234    
    ...        administrador=true
    Log        ${body}

    Criar Sessão na ServeRest

    ${response}    POST On Session    
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${body}

    Log        ${response.json()}
    Set Test Variable    ${RESPONSE}    ${response.json()}

Conferir se o usuário foi cadastrado corretamente
    Log     ${RESPONSE}
    Dictionary Should Contain Item    
    ...    dictionary=${RESPONSE}    
    ...    key=message    
    ...    value=Cadastro realizado com sucesso
    Dictionary Should Contain Key    
    ...    dictionary=${RESPONSE}    
    ...    key=_id
