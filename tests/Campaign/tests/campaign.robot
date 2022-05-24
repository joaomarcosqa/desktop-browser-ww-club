***Settings***
Resource    ../resources/campaign.resource

Test Setup       Access website
Test Teardown    Close website

Documentation
...    Suite de testes destinada aos testes de Campanha. Qualquer outra feature do sistema
...    deverá ser escrita em outro arquivo.

***Test Cases***
Cenário 01 - Visualização na Home:
    Dado que estou logado
    Quando acessar a home
    Então irei visualizar as campanhas

Cenário 02 - Visualização da campanha:
    Dado que estou logado
    Quando acessar uma campanha
    Então deverei ver o cabeçalho da campanha
    E os produtos deverão ser exibidos em listas

Cenário 03 - Botões de compartilhamento da campanha:
    Dado que estou logado
    Quando acessar uma campanha
    Então deverei ver botões de compartilhamento em redes sociais

Cenário 04 - Utilização do filtro de visualização
    Dado que estou logado
    Quando acessar uma campanha
    E selecionar a visualização por preço
    Então deverei visualizar os produtos sem quebras
