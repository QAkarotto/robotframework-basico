*** Variable ***
@{MESES}    janeiro
...         feveiro
...         março
...         abril
...         maio
...         junho
...         julho
...         agosto
...         setembro
...         outubro
...         novembro
...         dezembro  

*** Test Cases ***
Exercicio: imprime os meses do ano
    imprime cada um dos meses

*** Keywords ***
imprime cada um dos meses
    Log To Console    ${MESES[0]}
    Log To Console    ${MESES[1]}
    Log To Console    ${MESES[2]}
    Log To Console    ${MESES[3]}
    Log To Console    ${MESES[4]}
    Log To Console    ${MESES[5]}
    Log To Console    ${MESES[6]}
    Log To Console    ${MESES[7]}
    Log To Console    ${MESES[8]}
    Log To Console    ${MESES[9]}
    Log To Console    ${MESES[10]}
    Log To Console    ${MESES[11]}