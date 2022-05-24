***Settings***
Resource    ../../../shared/resources/setup.resource
Resource    ../../../shared/resources/teardown.resource
Resource    ../../../shared/resources/common.resource

Variables    ../../../shared/locators/campaign_locators.py

Documentation
...    Este recurso é feito exclusivamente para os testes de funcionalidade de campanhas.

***Keywords***

Dado que estou logado
    Click and Scroll Item    ${buttonAccessLogin}
    Run keyword              Login                   qa.test.user@westwing.com.br    123@westwingbr

Quando acessar a home
    Wait until element is visible    ${campaignMainContainer}
    Title should be                  Campanhas | Westwing.com.br

Quando acessar uma campanha
    Click and Scroll Item    ${secondCampaignButton}

E selecionar a visualização por preço
    Click and Scroll Item            ${campaignFilter}
    Wait until element is visible    ${priceFilter}
    Click Element                    ${priceFilter}

Então irei visualizar as campanhas
    ${Result}=                     Run Keyword And Return Status     Page Should Contain Element    ${featuredCampaignContainer}
    IF                             ${Result} == True
    Page should contain element    ${featureCampaignBuyNowButton}
    END
    Page should contain element    ${commonCampaignsContainer}

Então deverei ver o cabeçalho da campanha
    Wait until element is visible    ${campaingHeaderSection}

Então deverei ver botões de compartilhamento em redes sociais
    Page should contain element    ${facebookSharingButton}
    Page should contain element    ${messengerSharingButton}
    Page should contain element    ${emailSharingButton}
    Page should contain            Compartilhe com seus amigos

E os produtos deverão ser exibidos em listas
    Page should contain element    ${gridOfProducts}

Então deverei visualizar os produtos sem quebras
    Run keyword    E os produtos deverão ser exibidos em listas
