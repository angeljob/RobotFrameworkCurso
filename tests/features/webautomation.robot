*** Settings ***
Documentation        Aqui estarão presentes todos os testes automatizados do módulo de automação WEB.
Resource             ../../src/config/package.robot

Suite Setup            Abrir navegador
Suite Teardown         Fechar navegador

*** Variables ***
&{NOVO_USUARIO}
...        nome=Angel
...        ult_nome=Pereira
...        email=Angel.teste@robot.com
...        endereco=Rua Nova rua tal
...        universidade=OPET
...        profissao=Analista de Testes
...        genero=Masculino
...        idade=42

*** Test Cases ***
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
    #E clique na opção NOVO USUÁRIO
    #Quando finalizar o cadastro preenchendo todos os campos
    #Então deve ser apresentada a mensagem "Usuário Criado com sucesso"