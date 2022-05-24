***Settings***
Resource    ../resources/register.resource
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource

Variables    ../../../shared/locators/register_locators.py

Library    SeleniumLibrary
Library    FakerLibrary                        locale=pt_BR
Library    ../../../shared/libs/EmailLib.py


Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de cadastro de usuário

*** Variable ***
# ${usuarioLogado}    nome do usuário logado

*** Keywords ***
Dado que estou acessando o site do CLUB sem cadastro e clico em "Cadastre-se"
    Element Text Should Be    ${buttonSignUp}    Cadastre-se gratuitamente!
    Click Element             ${buttonSignUp}    

Quando preencho todos os campos obrigatórios corretamente
    ${email}       Get Random Email
    ${password}    FakerLibrary.Password
    Run Keyword    Fill in registration     ${email}    ${password}    
    Run Keyword    Click on accept terms

E clicar em Cadastre-se gratuitamente
    Run Keyword    Click on sign up

Então visualizarei meu nome na tela
    Wait Until Element Is Visible    ${myAccount}    
    Page Should Contain              Minha conta

Quando não preencher nenhum campo
    Run Keyword    Fill in registration    ${EMPTY}    ${EMPTY} 

Então deverei visualizar mensagens de campos obrigatórios nos demais campos
    Page Should Contain    Por favor, insira um e-mail válido            
    Page Should Contain    Por favor, forneça pelo menos 6 caracteres

Quando preencher os campos incorretamente
    Run Keyword    Fill in registration    emailErrado.com    123

Então deverei visualizar mensagens de preenchimento incorreto de campos
    Page Should Contain    Por favor, insira um e-mail válido            
    Page Should Contain    Por favor, forneça pelo menos 6 caracteres

Quando preencher os campos esquecendo de aceitar os termos
    ${email}       Get Random Email
    ${password}    FakerLibrary.Password
    Run Keyword    Fill in registration     ${email}    ${password}

Então não deverei ser logado
    Wait Until Element Is Visible    ${notAcceptTermsError}

Quando preencher os campos colocando um e-mail já cadastrado
    ${password}    FakerLibrary.Password
    Run Keyword    Fill in registration     qa.test.user@westwing.com.br    ${password}
    Run Keyword    Click on accept terms

Então deverei visualizar mensagem "Esse email já está registrado. Por favor, fazer o login normalmente"
    Wait Until Element Is Visible    ${emailTextFieldError}
    Page Should Contain              Esse email já está registrado. Por favor, fazer o login normalmente

Quando preencher os campos esquecendo de preencher a senha
    ${email}       Get Random Email
    Run Keyword    Fill in registration     ${email}    ${EMPTY}
    Run Keyword    Click on accept terms

Então deverei visualizar mensagem "Por favor, forneça pelo menos 6 caracteres"
    Page Should Contain    Por favor, forneça pelo menos 6 caracteres


Quando preencher os campos esquecendo de preencher o email
    ${password}    FakerLibrary.Password
    Run Keyword    Fill in registration     ${EMPTY}    ${password}
    Run Keyword    Click on accept terms

Então deverei visualizar mensagem "Por favor, insira um e-mail válido"
    Page Should Contain    Por favor, insira um e-mail válido 

Quando preencher os campos colocando uma senha com menos de 6 caracteres
    ${email}       Get Random Email
    Run Keyword    Fill in registration     ${email}    123
    Run Keyword    Click on accept terms

Quando preencher os campos passando um email inválido
    ${password}    FakerLibrary.Password
    Run Keyword    Fill in registration     emailErrado.com.br    ${password}
    Run Keyword    Click on accept terms


Fill in registration
    [Arguments]                      ${email}                ${password}     
    Wait Until Element Is Visible    ${emailTextField}       
    Input Text                       ${emailTextField}       ${email}
    Input Text                       ${passwordTextField}    ${password} 

Click on accept terms
    Click Element    ${acceptedTerms}

Click on sign up
    Click Element    ${buttonAccountCreate}
