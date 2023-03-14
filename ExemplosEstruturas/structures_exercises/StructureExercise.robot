*** Settings ***
Documentation   Exercícios de estruturas

*** Variables ***
@{NUMEROS}    1    2    3    5    7    10

*** Test Case ***

Imprimindo numeros
    Percorrer lista e imprimir


*** Keywords ***

Percorrer lista e imprimir
    Log To Console    ${\n}
    FOR  ${NUMERO}   IN  @{NUMEROS}
        IF  ${NUMERO} == 5 or ${NUMERO} == 10
            Log To Console    Eu sou o número ${NUMERO}!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
        END
    END