*** Settings ***
Library    String

*** Keywords ***
Gera email
    [Arguments]    ${nome}    ${sobrenome}
        ${palavra_aleatoria}    Generate Random String    length=6    chars=[LETTERS]
    [Return]    ${nome}${sobrenome}${palavra_aleatoria}@testerobot.com

*** Test Cases ***
Exercicio: imprime email gerado e retornado pela keyword
    ${EMAIL_GERADO}    Gera email    Goku    QA
    Log To Console    ${EMAIL_GERADO}
