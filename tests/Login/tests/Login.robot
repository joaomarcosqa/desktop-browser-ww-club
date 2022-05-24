***Settings***
Resource    ../resources/login.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Test Setup       Access website
Test Teardown    Close website

Documentation
...    Suite de testes destinada aos testes de Login. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.

***Test Cases***
Cenário 01: Login com sucesso - E-mail
    Dado que eu sou um cliente já existente 
    Quando for realizar login 
    Então devo ver meu nome na tela

Cenário 02: Login sem sucesso - campo email ou cpf não preenchido
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando clicar para logar e não houver caracteres preenchidos no campo de e-mail ou CPF
    Então deverá exibir a mensagem “Por favor, insira um e-mail ou CPF válido”

Cenário 03: Login sem sucesso - campo senha não preenchido
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando clicar para logar e não houver caracteres preenchidos no campo de senha
    Então deve ser exibido a mensagem “Por favor, forneça pelo menos 6 caracteres”

Cenário 04: Login com CPF sem sucesso - validação de CPF
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando inserir apenas números no campo de e-mail ou CPF e este não seja válido
    Então deverá realizar validação de CPF exibindo “Por favor, insira um CPF válido”

Cenário 05: Login com CPF sem sucesso - validação genérica
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando inserir números e letras no campo de e-mail ou CPF e este não seja válido
    Então deverá exibir a mensagem “Por favor, insira um e-mail ou CPF válido”

Cenário 06: Login sem sucesso - e-mail em formato inválido
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando inserir um e-mail com formado inválido
    Então deverá exibir a mensagem “Por favor, insira um e-mail ou CPF válido”

Cenário 07: Login com e-mail sem sucesso - senha inválida
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando preencher o campo de senha com menos de seis caracteres
    Então deve ser exibido a mensagem “Por favor, forneça pelo menos 6 caracteres” 

Cenário 08: Login com CPF sem sucesso - senha incorreta
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando inserir um CPF válido e digitar uma senha inválida a partir de seis caracteres
    E deverá exibir a mensagem “Senha ou CPF incorreto”

Cenário 09: Login com e-mail sem sucesso - senha incorreta
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando preencher um e-mail válido e uma senha incorreta a partir de seis caracteres
    Então deverá exibir a mensagem “Senha ou e-mail incorreto”

Cenário 10: Login com sucesso - CPF
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando preencher um CPF e senha válidos
    Então o sistema deverá realizar login normalmente e devo visualizar meu nome em tela

Cenário 11: Login com e-mail sem sucesso - e-mail não existente na base de dados
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando inserir um e-mail não cadastrado na base de dados junto a senha válida
    Então deverá exibir a mensagem “Senha ou e-mail incorreto”

Cenário 12: Login com e-mail sem sucesso - campo de e-mail e senha vazios
    Dado que para logar no CLUB devo preencher os campos corretamente
    Quando não inserir nada nos campos 'e-mail ou CPF' e 'senha', deixambos ambos vazios
    Então deverá exibir a mensagem “Por favor, insira um e-mail ou CPF válido”
    E deve ser exibido a mensagem “Por favor, forneça pelo menos 6 caracteres”

