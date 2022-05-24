***Settings***
Resource    ../resources/login.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/login_locators.py

Library     SeleniumLibrary
Resource    ../../../shared/resources/common.resource


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de login.

***Keywords***

Dado que eu sou um cliente já existente
    Click and Scroll Item    ${buttonAccessLogin}

Quando for realizar login
    Run Keyword    Login    enzo.franzini@westwing.com.br    123456

Então devo ver meu nome na tela
    Page Should Not Contain Textfield    ${buttonAccessLogin}    Já é um membro? Faça o Login 

Dado que para logar no CLUB devo preencher os campos corretamente
    Click and Scroll Item    ${buttonAccessLogin}

Quando clicar para logar e não houver caracteres preenchidos no campo de e-mail ou CPF
    Run Keyword    Login    ${EMPTY}    1234567

Quando inserir números e letras no campo de e-mail ou CPF e este não seja válido
    Run Keyword    Login    11111111113a    1234567

Quando inserir um e-mail com formado inválido
    Run Keyword    Login    email_formato_invalido.com.br    1234567

Quando não inserir nada nos campos 'e-mail ou CPF' e 'senha', deixambos ambos vazios
    Run Keyword    Login    ${EMPTY}    ${EMPTY}

Então deverá exibir a mensagem “Por favor, insira um e-mail ou CPF válido”
    Wait Until Element Is Visible    ${identifierTextField}                       
    Page Should Contain              Por favor, insira um e-mail ou CPF válido    

E deve ser exibido a mensagem “Por favor, forneça pelo menos 6 caracteres”
    Page Should Contain    Por favor, forneça pelo menos 6 caracteres

Quando clicar para logar e não houver caracteres preenchidos no campo de senha
    Run Keyword    Login    hehasa9603@sumwan.com    ${EMPTY} 

Quando preencher o campo de senha com menos de seis caracteres
    Run Keyword    Login    hehasa9603@sumwan.com    1234 

Então deve ser exibido a mensagem “Por favor, forneça pelo menos 6 caracteres”
    Wait Until Element Is Visible    ${identifierTextField}                         
    Page Should Contain              Por favor, forneça pelo menos 6 caracteres 

Quando inserir apenas números no campo de e-mail ou CPF e este não seja válido
    Run Keyword    Login    11111111113    1234567

Então deverá realizar validação de CPF exibindo “Por favor, insira um CPF válido”
    Wait Until Element Is Visible    ${identifierTextField}             
    Page Should Contain              Por favor, insira um CPF válido    

Quando inserir um CPF válido e digitar uma senha inválida a partir de seis caracteres
    Run Keyword    Login    14993454023    10303549

E deverá exibir a mensagem “Senha ou CPF incorreto”
    Wait Until Page Contains    Senha ou CPF incorreto    
    Page Should Contain         Senha ou CPF incorreto

Quando preencher um e-mail válido e uma senha incorreta a partir de seis caracteres
    Run Keyword    Login    hehasa9603@sumwan.com    123457

Então deverá exibir a mensagem “Senha ou e-mail incorreto”
    Wait Until Page Contains    Senha ou e-mail incorreto    
    Page Should Contain         Senha ou e-mail incorreto

Quando preencher um CPF e senha válidos
    Run Keyword    Login    14993454023    123456

Então o sistema deverá realizar login normalmente e devo visualizar meu nome em tela
    Wait Until Element Is Visible    ${account}    30
    Element Text Should Be           ${account}    TESTE

Quando inserir um e-mail não cadastrado na base de dados junto a senha válida
    Run Keyword    Login    hehasa9603@emailnaocadastrado.com    123457

Login
    [Arguments]                      ${identifier}             ${password}      
    Wait Until Element Is Visible    ${identifierTextField}    30
    Input Text                       ${identifierTextField}    ${identifier}
    Wait Until Element Is Visible    ${passwordTextField}      30
    Input Text                       ${passwordTextField}      ${password} 
    Wait Until Element Is Visible    ${passwordTextField} 
    Click Element                    ${buttonLogin}




