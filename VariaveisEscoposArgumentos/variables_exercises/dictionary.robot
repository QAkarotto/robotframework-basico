*** Variable ***
&{MESES}    janeiro=31
...         fevereiro=28
...         marco=31
...         abril=30
...         maio=31
...         junho=30
...         julho=31
...         agosto=31
...         setembro=30
...         outubro=31
...         novembro=30
...         dezembro=30

*** Test Cases ***
Exercicio: imprime os meses do ano
    Log To Console    Janeiro tem ${MESES.janeiro} dias
    Log To Console    Fevereiro tem ${MESES.fevereiro} dias
    Log To Console    Março tem ${MESES.marco} dias
    Log To Console    Abril tem ${MESES.abril} dias
    Log To Console    Maio tem ${MESES.maio} dias
    Log To Console    Junho tem ${MESES.junho} dias
    Log To Console    Julho tem ${MESES.julho} dias
    Log To Console    Agosto tem ${MESES.agosto} dias
    Log To Console    Setembro tem ${MESES.setembro} dias
    Log To Console    Outubro tem ${MESES.outubro} dias
    Log To Console    Novembro tem ${MESES.novembro} dias
    Log To Console    Dezembro tem ${MESES.dezembro} dias