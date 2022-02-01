*** Settings ***
Documentation    Aqui estarao presentes todos os testes iniciais do curso robotframework basico.

*** Variables ***
${CLIENTE}    www.boticario.com.br

&{PESSOA}
...    nome=Angel
...    sobrenome=Pereira
...    idade=42
...    cpf=02130302321
...    rg=454513

@{FRUTAS}
...    manga
...    abacaxi
...    uva
...    melancia
...    limao


*** Test Cases ***
Cenario : Imprimir cliente.
    [Tags]    CLIENTE
    Log     ${CLIENTE}
Cenario 1: Imprimir dicionario no console. 
    Log To Console    \n${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}

Cenario 2: Imprimir lista de Frutas no console.
    [Tags]    LISTA
    Log To Console    \n${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}    

Cenario 3: Somando usando argumentos.
    [Tags]    SOMA
    Somar dois numeros    5    7
    Somar os numeros "13" e "17"

Cenario 4: Desafio da criação do e-mail.
    [Tags]            EMAIL
    ${EMAIL}          Criar meu e-mail    angel    pereira    42
    Log To Console    ${EMAIL}

Cenario 5: Contar de 0 a 9.
    [Tags]    CONTAR
    Contar de 0 a 9
    Percorrer lista de frutas
    Contar de 0 a 10
    Tomar decisões    Maria

Cenario 6: Imprimindo somente o numero 5 e 8
    [Tags]    if
    Imprimindo somente o 5 e o 8

*** Keywords ***
Somar dois numeros
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     \n${SOMA}
    [Return]           ${SOMA}
  
Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA}

Criar meu e-mail
    [Arguments]        ${NOME}    ${SOBRENOME}    ${IDADE}
    ${EMAIL}           Catenate    SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    Log To Console    \n${EMAIL}
    [Return]           ${EMAIL}@UOL.COM

Contar de 0 a 9
    FOR    ${COUNT}    IN RANGE    0    9
        Log To Console    Numero ${COUNT}
    END

Percorrer lista de frutas
    @{FRUTAS}    Create List    Banana    Abacaxi    Melancia    Morango
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console    ${fruta}
    END

Contar de 0 a 10
    FOR    ${COUNT}    IN RANGE    0    11
        Log To Console    Estou no número ${COUNT}
    END

Tomar decisões
    [Arguments]    ${NOME}
    IF    '${NOME}'=='Maria'
        Log To Console     Vou fazer isso aqui só quando for Maria!
    ELSE IF    '${NOME}'=='João'
        Log To Console     Vou fazer isso aqui só quando for João!
    ELSE
        Log To Console     Vou fazer isso aqui só quando for qualquer outra pessoa!
    END

Imprimindo somente o 5 e o 8
    FOR    ${COUNT}    IN RANGE    0    11
        IF    '${COUNT}'=='5'
            Log To Console    \nEstou no número ${COUNT}
        ELSE IF    '${COUNT}'=='8'
            Log To Console    Estou no número ${COUNT}
        END
    END