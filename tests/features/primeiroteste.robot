*** Settings ***
Documentation        Aqui estarão presentes todos os testes iniciais do curso de Robot Framework básico
*** Variables ***
${CLIENTE}     www.oboticario.com.br

&{PESSOA}    
...            nome=Helder    
...            sobrenome=Fernandes    
...            idade=27    
...            cpf=12345678911    
...            rg=1234567891
...            carro=Sentra

@{FRUTAS}
...            manga
...            melancia
...            abacaxi
...            morango
...            limão

*** Test Cases ***
Cenario 1: Imprimir dicionário no console
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}
    Log To Console    ${PESSOA.carro}

Cenario 2: Imprimir Lista de fruta no console
    [Tags]            LISTA
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}

Cenario 3: Somando usando argumentos
    [Tags]            SOMA
    Somar dois números    3216    98794
    Somar os números "65494" e "132136"

Cenario 4: Desafio da criação do e-mail
    [Tags]            EMAIL
    ${EMAIL}           Criar meu e-mail    helder    fernandes    27
    Log To Console     ${EMAIL}

Cenario 5: Contar de 0 a 9
    [Tags]        CONTA
    Contar de 0 a 9
    Percorrer lista de frutas
    Contar de 0 a 10

Cenario 6: Imprimindo somente o número 5 e 8
    [Tags]        if
    Imprimindo somente o 5 e o 8

*** Keywords ***
Somar dois números
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA}

Somar os números "${NUM_A}" e "${NUM_B}"
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA}

Criar meu e-mail
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    ${EMAIL}       Catenate   SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    [Return]       ${EMAIL}

Contar de 0 a 9
    FOR  ${COUNT}    IN RANGE     0    9
        Log To Console    ${COUNT}
    END

Percorrer lista de frutas
    @{FRUTAS}    Create List    Banana   Abacaxi    Melancia    Morango
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console    ${fruta} 
    END

Contar de 0 a 10
    FOR  ${COUNT}    IN RANGE     0    11
        Log To Console   Estou no número: ${COUNT}
    END

Tomar decisões
	IF   '${NOME}'=='Maria'
		Log    Vou fazer isso aqui só quando for a Maria!
	ELSE IF    '${NOME}'=='João'
		Log    Vou fazer isso aqui só quando for o João!
	ELSE
		Log    Vou fazer isso aqui só quando for qualquer outra pessoa!
	END

Imprimindo somente o 5 e o 8
    FOR  ${COUNT}    IN RANGE     0    11
        IF  '${COUNT}'=='5'
            Log To Console   \nEstou no número: ${COUNT}
        ELSE IF  '${COUNT}'=='8'
            Log To Console   Estou no número: ${COUNT}
        END
    END