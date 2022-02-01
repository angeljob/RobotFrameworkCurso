*** Settings ***

Documentation        Aqui estarão presentes todos os testes automatizados do módulo de automação WEB.


Library    SeleniumLibrary
Library    DebugLibrary


Suite Setup            Abrir navegador

Suite Teardown         Fechar navegador


*** Variables ***

&{NOVO_USUARIO}

...        nome=Angel

...        ult_nome=Pereira

...        email=angel.teste@robot.com

...        endereco=Rua tal

...        universidade=OPET

...        profissao=Analista de testes

...        genero=Masculino

...        idade=42


*** Test Cases ***

Cenario: Criar usuário com sucesso

    [Tags]                           abre_navegador

    Title Should Be                  Automação com Batista

    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Novo Usuário!!')]

   

    Input Text        id=user_name        ${NOVO_USUARIO.nome}

    Input Text        id=user_lastname    ${NOVO_USUARIO.ult_nome}

    Input Text        id=user_email       ${NOVO_USUARIO.email}

    Input Text        id=user_address     ${NOVO_USUARIO.endereco}

    Input Text        id=user_university  ${NOVO_USUARIO.universidade}

    Input Text        id=user_profile     ${NOVO_USUARIO.profissao}

    Input Text        id=user_gender      ${NOVO_USUARIO.genero}

    Input Text        id=user_age         ${NOVO_USUARIO.idade}


    Click Element     xpath=//input[@value='Criar']


    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Usuário Criado com sucesso')]

   

    Wait Until Page Contains         ${NOVO_USUARIO.nome}

    Wait Until Page Contains         ${NOVO_USUARIO.ult_nome}

    Wait Until Page Contains         ${NOVO_USUARIO.email}

    Wait Until Page Contains         ${NOVO_USUARIO.endereco}

    Wait Until Page Contains         ${NOVO_USUARIO.universidade}

    Wait Until Page Contains         ${NOVO_USUARIO.profissao}

    Wait Until Page Contains         ${NOVO_USUARIO.genero}

    Wait Until Page Contains         ${NOVO_USUARIO.idade}


Cenario: Criar usuário com sucesso usando BDD

    [Tags]            BDD

    Dado que o cliente esteja na tela de cadastro

    E preencher todos os campos

    Quando clicar em Criar

    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"


Cenario: Criar usuario sem informar o nome

    [Tags]        NOME

    Dado que o cliente esteja na tela de cadastro

    E preencher todos os campos exceto o campo nome

    Quando clicar em Criar

    Então deve ser apresentada a mensagem     Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank


Cenario: Criar usuario sem informar o email

    [Tags]        NOME

    Dado que o cliente esteja na tela de cadastro

    E preencher todos os campos exceto o campo email

    Quando clicar em Criar

    Então deve ser apresentada a mensagem     Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.invalid


Cenario: Criar usuário através da sessão de lista de usuários
    [Tags]        LISTA
    Dado que eu esteja na tela de lista de usuários
    E clique na opção NOVO USUÁRIO
    Quando finalizar o cadastro preenchendo todos os campos
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"

*** Keywords ***

Dado que o cliente esteja na tela de cadastro    

    Title Should Be                  Automação com Batista

    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Novo Usuário!!')]

    Capture Page Screenshot


E preencher todos os campos

    Input Text        id=user_name        ${NOVO_USUARIO.nome}

    Input Text        id=user_lastname    ${NOVO_USUARIO.ult_nome}

    Input Text        id=user_email       ${NOVO_USUARIO.email}

    Input Text        id=user_address     ${NOVO_USUARIO.endereco}

    Capture Page Screenshot

    Input Text        id=user_university  ${NOVO_USUARIO.universidade}

    Input Text        id=user_profile     ${NOVO_USUARIO.profissao}

    Input Text        id=user_gender      ${NOVO_USUARIO.genero}

    Input Text        id=user_age         ${NOVO_USUARIO.idade}

    Capture Page Screenshot


Quando clicar em Criar

    Click Element     xpath=//input[@value='Criar']


Então deve ser apresentada a mensagem "${MENSAGEM}"

    Capture Page Screenshot

    Wait Until Element Is Visible    xpath=//*[contains(text(), '${MENSAGEM}')]

   

    Wait Until Page Contains         ${NOVO_USUARIO.nome}

    Wait Until Page Contains         ${NOVO_USUARIO.ult_nome}

    Wait Until Page Contains         ${NOVO_USUARIO.email}

    Wait Until Page Contains         ${NOVO_USUARIO.endereco}

    Wait Until Page Contains         ${NOVO_USUARIO.universidade}

    Wait Until Page Contains         ${NOVO_USUARIO.profissao}

    Wait Until Page Contains         ${NOVO_USUARIO.genero}

    Wait Until Page Contains         ${NOVO_USUARIO.idade}      

   

Abrir navegador

    Open Browser                     about:blank            chrome

    Go To                            https://automacaocombatista.herokuapp.com/users/new

    Maximize Browser Window

    Set Selenium Timeout             20


Fechar navegador

    Capture Page Screenshot

    Close Browser


E preencher todos os campos exceto o campo nome

    Input Text            id=user_lastname    ${NOVO_USUARIO.ult_nome}

    Input Text            id=user_email       ${NOVO_USUARIO.email}

    Input Text            id=user_address     ${NOVO_USUARIO.endereco}

    Input Text            id=user_university  ${NOVO_USUARIO.universidade}

    Input Text            id=user_profile     ${NOVO_USUARIO.profissao}

    Input Text            id=user_gender      ${NOVO_USUARIO.genero}

    Input Text            id=user_age         ${NOVO_USUARIO.idade}

    Capture Page Screenshot

   

E preencher todos os campos exceto o campo email

    Input Text        id=user_name        ${NOVO_USUARIO.nome}

    Input Text        id=user_lastname    ${NOVO_USUARIO.ult_nome}

    Input Text        id=user_address     ${NOVO_USUARIO.endereco}

    Input Text        id=user_university  ${NOVO_USUARIO.universidade}

    Input Text        id=user_profile     ${NOVO_USUARIO.profissao}

    Input Text        id=user_gender      ${NOVO_USUARIO.genero}

    Input Text        id=user_age         ${NOVO_USUARIO.idade}

    Capture Page Screenshot



Então deve ser apresentada a mensagem

    [Arguments]                     ${ERRO}

    Wait Until Page Contains        ${ERRO}

    IF     '${ERRO}'=='Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank'

            Clear Element Text    id=user_email

    END   

Dado que eu esteja na tela de lista de usuários
    Open Browser
    Debug
    Wait Until Element Is Visible    href=/users
    Capture Page Screenshot

E clique na opção NOVO USUÁRIO
    Click Element    href=/users
    Wait Until Element Is Visible    href=/users/new
    Click Element    href=/users/new
    Capture Page Screenshot
Quando finalizar o cadastro preenchendo todos os campos    Input Text
    Wait Until Element Is Visible    id=user_id 
    Input Text        id=user_id    ${NOVO_USUARIO.nome}
    Input Text        id=user_lastname     ${NOVO_USUARIO.ult_nome}
    Input Text        id=user_email  ${NOVO_USUARIO.email}
    Input Text        id=user_address     ${NOVO_USUARIO.Rua}
    Input Text        id=user_university      ${NOVO_USUARIO.universidade}
    Input Text        id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text        id=user_gender      ${NOVO_USUARIO.genero}
    Input Text        id=user_age         ${NOVO_USUARIO.idade}
    Click Element    xpath=//*[contains(text(), 'Criar')]