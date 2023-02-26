*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}                  chrome
${URL}                      http://www.amazon.com.br
${MENU_ELETRONICOS}
...                         //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${BARRA_PESQUISA}           twotabsearchtextbox
${BOTAO_PESQUISAR}          nav-search-submit-button
${BOTAO_CARRINHO}           //span[@aria-hidden='true'][contains(.,'Carrinho')]
${TITULO_CARRINHO_VAZIO}           //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a homepage do site Amazon.com.br
    Go To    url=${URL}

Entrar no Menu "Eletrônicos"
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${TEXTO_ELETRONICOS}"
    Wait Until Page Contains    text=${TEXTO_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título de página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[@alt='${NOME_CATEGORIA}']

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=${BARRA_PESQUISA}    text=${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${BOTAO_PESQUISAR}

Verificar se o resultado da pesquisa está listando o produto "${NOME_PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${NOME_PRODUTO}')])

Adicionar o produto "${NOME_PRODUTO}" no carrinho
    Click Element    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${NOME_PRODUTO}')])
    Wait Until Element Is Visible    locator=add-to-cart-button
    Click Element    locator=add-to-cart-button

Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso
    Click Element    locator=${BOTAO_CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${NOME_PRODUTO}')]

Remover o produto "${NOME_PRODUTO}" do carrinho
    Click Element    locator=//input[contains(@aria-label,'Excluir ${NOME_PRODUTO}')]
    

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=${TITULO_CARRINHO_VAZIO} 


# GHERKIN STEPS

Dado que estou na homepage da Amazon.com.br
    Acessar a homepage do site Amazon.com.br
    Verificar se o título de página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no Menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título de página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título de página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar se o resultado da pesquisa está listando o produto "Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o resultado da pesquisa está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o resultado da pesquisa está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio