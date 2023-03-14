*** Settings ***
Resource    ./usuarios.resource

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um usuário
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados

Cenário 04: Logar com o novo usuário criado
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Realizar Login com o usuário    email=${EMAIL_TESTE}    status_code_desejado=200
    Conferir se o Login ocorreu com sucesso
    
