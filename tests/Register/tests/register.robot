
***Settings***
Resource    ../resources/register.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Test Setup       Access website
Test Teardown    Close website

Documentation
...    Suite de testes destinada aos testes de cadastros de usuários. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.

***Test Cases***
Cenário 01: Cadastro de usuário - sucesso
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencho todos os campos obrigatórios corretamente
    E clicar em Cadastre-se gratuitamente
    Então visualizarei meu nome na tela

Cenário 02: Cadastro de usuário sem sucesso - validação de campos obrigatórios
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando não preencher nenhum campo
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagens de campos obrigatórios nos demais campos

Cenário 03: Cadastro de usuário sem sucesso - Preenchimento inválido de campos
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos incorretamente 
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagens de preenchimento incorreto de campos

Cenário 04: Cadastro de usuário sem sucesso - sem aceitar os termos
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos esquecendo de aceitar os termos 
    E clicar em Cadastre-se gratuitamente
    Então não deverei ser logado

Cenário 05: Cadastro de usuário sem sucesso - e-mail já existente
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos colocando um e-mail já cadastrado 
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagem "Esse email já está registrado. Por favor, fazer o login normalmente"

Cenário 06: Cadastro de usuário sem sucesso - por campo de senha vazio
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos esquecendo de preencher a senha 
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagem "Por favor, forneça pelo menos 6 caracteres"

Cenário 07: Cadastro de usuário sem sucesso - por campo de e-mail vazio
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos esquecendo de preencher o email
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagem "Por favor, insira um e-mail válido"

Cenário 08: Cadastro de usuário sem sucesso - por senha com menos de 6 caracteres
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos colocando uma senha com menos de 6 caracteres
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagem "Por favor, forneça pelo menos 6 caracteres"

Cenário 09: Cadastro de usuário sem sucesso - por email inválido
    Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Quando preencher os campos passando um email inválido
    E clicar em Cadastre-se gratuitamente
    Então deverei visualizar mensagem "Por favor, insira um e-mail válido"
