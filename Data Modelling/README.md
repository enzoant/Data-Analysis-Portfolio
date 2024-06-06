# Project Preview

Após a uma série de reuniões com diversos setores da empresa e alta liderança, eis o panorama geral do projeto:

_______________________________________________________________________________________________________________________________________________________________
# [Business Analysis](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/Business_Analysis_Data_Modelling_Project.pdf)

*High Computing Manufacture Inc* is a company specialized in manufacturing and selling electronics, with a particular focus on computer equipment. The company operates with aggressive profit margins and, although the marketing investment is modest, it is continuous. It has several stores across Brazil and employs about 400 people.

Each store carries a variety of electronic products, including desktops, notebooks, tablets, and smartphones, which are the company's main items. In addition to these, other products such as TVs, sound systems, and peripherals are also sold. In total, there are approximately 150 products distributed across 15 categories.

A warehouse located in Barueri - SP receives products imported or sourced from factories in São Paulo and Minas Gerais. There, the products are cataloged, tagged with RFID labels, and shipped to stores nationwide. Each product has a unique SKU code and details stored in the product registration system, including name, brand, dimensions, and technical specifications.

Whenever a sale is made in one of the 18 stores across Brazil, the salespeople are instructed to create a customer record and request authorization to send future promotions and marketing campaigns. Name, phone number, address, and email are mandatory information in the record, while other information such as current employment, income, length of residence, and number of children may be requested, especially for installment sales.

In each store, employees serve customers both in the showroom, where products are displayed, and over the phone. Each establishment has salespeople, cleaning staff, and a supervisor, working in two shifts. The company plans to start selling online, although no date has been set yet.

All employees are registered in the company's internal system, with a registration number, personal data, and specialties. Sales are always made by salespeople, who receive commissions for the sales made, and the registration number of the responsible salesperson is linked to each sale. The values and quantities of sales are included in the company's daily reports, which are used for different decisions throughout the week. However, these reports are manually generated in Excel and often contain errors.

The company maintains a detailed record of each store, currently managed in an Excel spreadsheet. This spreadsheet contains the name (a nickname for identification), address, region, city, and state of each store, as well as a unique code. This spreadsheet is periodically updated in the company's sales system, as each transaction is linked to a specific store. Each regional director needs to monitor sales by region to track the performance of their stores and compare them with other regions.

All stores sell all products, but the stocks are differentiated to reduce logistical costs, avoiding the excessive dispatch of products to stores with lower sales volume, which could require later redistribution to stores with higher demand. Each store has a carefully registered postal code, as the company frequently implements logistical optimization algorithms using graph analysis. Recently, they adopted a new system based on Artificial Intelligence, which promised to reduce fuel costs by up to 25% by optimizing delivery truck routes.

The company conducts many sales of products in packages or combos, which can include different items. For example, a desktop can be sold together with a monitor, keyboard, and mouse. Although sold as a package, each product has its own SKU, individual value, and contributes differently when a discount is applied. The company calculates the percentage contribution of each product in package or combo sales.

## Business problems presented

- Are there product categories that are not profitable? If so, which ones?
- Draw up expansion strategies.
- What new product categories should be considered for future sales?
_______________________________________________________________________________________________________________________________________________________________

# Modelo Conceitual

A partir de tal documento, as principais necessidades da empresa podem ser extraídos. Assim, é possível montar as entidades, atributos e relacionamentos identificados, e assim criar o seguinte modelo conceitual para o Data Warehouse:

## Entidades e Atributos:

- Loja
  - Code (Primary Key)
  - Name
  - City
  - State
  - Postal Code

- Produto
  - SKU Code (Primary Key)
  - Name
  - Brand
  - Category

- Salesmen
  - Registration (Primary Key)
  - Name

- Client
  - Client ID
  - Name
  - Address
  - City
  - State

- Date
  - Full date
  - Year
  - Month
  - Day

- Sale
  - Date (Foreign Key)
  - Transaction ID (Primary Key)
  - Product (Foreign Key)
  - Store (Foreign Key)
  - Salesman (Foreign Key)
  - Client (Foreign Key)
  - Amount sold
  - Total sold

## Relationships:

- **Store makes Sales**: A store can make several sales, but each sale is associated with a single store.
- **Sale involves Product**: A sale can include several products and a product can be involved in several sales.
- **Sale is associated with a Customer**: A sale is associated with a single customer, but a customer can be associated with several sales.
- **Sale is made by Seller**: A sale is made by a single seller, but a seller can make several sales.
- **Sale occurs on a Date**: A sale occurs on a single date, but several sales can occur on the same date.

Este modelo conceitual serve como um guia para a construção do modelo dimensional e do modelo lógico do Data Warehouse, facilitando a organização dos dados e a realização de análises e consultas.

Seguimos, portanto, com a preparação do modelo dimensional e do modelo lógico.
_______________________________________________________________________________________________________________________________________________________________
# Modelo Dimensional

Considerando o relatório compartilhado e as informações extraídas dele, iremos preparar o modelo dimensional.
Premissas:
- Não há relações complexas entre os dados e muitos níveis.
- Por se tratar de uma rede de uma manufatura, provavelmente o volume de vendas será alto e, portanto, o volume de dados também. Neste caso, uma performance melhor será preferível.
- Não foi necessária a preparação de tabelas intermediárias.

A partir da análise das premissas acima, a abordagem de Star Schema será adotada, pois todas as tabelas DIMENSÃO estão diretamente associadas à tabela FATO, possui uma relação simples e direta entre as tabelas (agilizando a transmissão de informação) e por possuir, em geral, uma performance superior.

Veja na imagem abaixo o modelo dimensional deste projeto.

![image](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/Dimensional%20Model.jpg)

_______________________________________________________________________________________________________________________________________________________________
# Modelo Lógico

Abaixo você encontra o Modelo Lógico do Projeto 3, que pode ser usado como template para outros projetos.

Com base nos modelos conceitual e dimensional podemos criar o seguinte modelo lógico para o Data Warehouse:

Tabelas e Colunas:

- DIM_LOJA
  - Codigo (PK): INT
  - Nome: VARCHAR (255)
  - Cidade: VARCHAR (255)
  - Estado: CHAR (2)
- DIM PRODUTO
  - Codigo_SKU (PK): INT
  - Nome: VARCHAR (255)
  - Marca: VARCHAR (255)
  - Categoria: VARCHAR (255)
- DIM_CLIENTE
  - ID_Cliente (PK): INT
  - Nome: VARCHAR (255)
  - Endereço: VARCHAR (255)
  - Cidade: VARCHAR (255)
  - Estado: CHAR (2)
- DIM VENDEDOR
  - Matricula (PK): INT
  - Nome: VARCHAR (255)
- DIM_DATA
  - Data Completa (PK): DATE
  - Ano: INT
  - Mes: INT
  - Dia: INT
- FATO_VENDA
  - Data (FK) -> DIM_Data.Data_Completa: DATE 
  - Produto (FK) -> DIM_Produto.Codigo_SKU: INT
  - Loja (FK) -> DIM_Loja.Codigo: INT
  - Vendedor (FK) -> DIM_Vendedor.Matrícula: INT
  - Cliente (FK) -> DIM_Cliente.ID_Cliente: INT
  - Quantidade Vendida: INT
  - Total_Venda: DECIMAL (10,2)
  - ID_Transacao (NK): INT

**Chaves**:

- PK: Chave Primária (Primary Ley)
- FK: Chave Estrangeira (Foreign Key)
- NK: Chave Natural (Natural Key)

**Observações**:

- Cada tabela possui uma chave primária (PK) que a identifica de forma única.
- As chaves estrangeiras (FK) estabelecem os relacionamentos entre as tabelas. Por exemplo, a coluna "Data" na tabela "FATO_VENDA" é uma chave estrangeira que referencia a coluna "Data_Completa" na tabela "DIM_Data".
- A chave natural é chave primária na fonte, mas será apenas informação complementar no DW.
- As FKs na tabela FATO formarão a chave primária composta da tabela.

Este modelo lógico representa a estrutura do Data Warehouse em um nível mais detalhado, definindo as tabelas, colunas e relacionamentos que serão implementados no banco de dados.





















