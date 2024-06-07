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

A partir de tal documento, as principais necessidades da empresa podem ser extraídos. Assim, é possível montar as entidades, atributos e relacionamentos identificados, e assim criar o seguinte modelo conceitual para o Data Warehouse (DW):

## Entidades e Atributos:

- Loja
  - Code (Primary Key)
  - Name
  - City
  - State

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

Este modelo conceitual serve como um guia para a construção do modelo dimensional e do modelo lógico do Data Warehouse (DW), facilitando a organização dos dados e a realização de análises e consultas.

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

Com base nos modelos conceitual e dimensional podemos criar o seguinte modelo lógico para o Data Warehouse (DW):

Tabelas e Colunas:

- DIM_STORE
  - Code (PK): INT
  - Name: VARCHAR (255)
  - City: VARCHAR (255)
  - State: CHAR (2)
- DIM_PRODUCT
  - SKU_Code (PK): INT
  - Name: VARCHAR (255)
  - Brand: VARCHAR (255)
  - Category: VARCHAR (255)
- DIM_CLIENT
  - Client_ID (PK): INT
  - Name: VARCHAR (255)
  - Address: VARCHAR (255)
  - City: VARCHAR (255)
  - State: CHAR (2)
- DIM_SELLER
  - Registration (PK): INT
  - Name: VARCHAR (255)
- DIM_DATE
  - Full_date (PK): DATE
  - Year: INT
  - Month: INT
  - Day: INT
- FACT_SALES
  - Date (FK) -> DIM_Data.Data_Completa: DATE 
  - Product (FK) -> DIM_Produto.Codigo_SKU: INT
  - Store (FK) -> DIM_Loja.Codigo: INT
  - Seller (FK) -> DIM_Vendedor.Matrícula: INT
  - Client (FK) -> DIM_Cliente.ID_Cliente: INT
  - Amount_sold: INT
  - Total_sold: DECIMAL (10,2)
  - Transaction_ID (NK): INT

**Chaves**:

- PK: Chave Primária (Primary Ley)
- FK: Chave Estrangeira (Foreign Key)
- NK: Chave Natural (Natural Key)

**Observações**:

- Cada tabela possui uma chave primária (PK) que a identifica de forma única.
- As chaves estrangeiras (FK) estabelecem os relacionamentos entre as tabelas. Por exemplo, a coluna "Data" na tabela "FATO_VENDA" é uma chave estrangeira que referencia a coluna "Data_Completa" na tabela "DIM_Data".
- A chave natural é chave primária na fonte, mas será apenas informação complementar no DW.
- As FKs na tabela FATO formarão a chave primária composta da tabela.

Este modelo lógico representa a estrutura do Data Warehouse (DW) em um nível mais detalhado, definindo as tabelas, colunas e relacionamentos que serão implementados no banco de dados.

_______________________________________________________________________________________________________________________________________________________________
# Modelo Físico

Tendo em mãos os modelos dimensional e lógico, podemos seguir para a preparação do Modelo Físico.

Em um sistema PostgreSQL, utilizamos o pgAdmin para acessar o servidor e preparar as tabelas do nosso Data Warehouse.

O código utilizado é o que segue abaixo. Os comentários ao lado de cada trecho possuem instruções e/ou descrições das diversas decisões tomadas.

```
-- Projeto 3 - Modelo Físico
CREATE SCHEMA dw AUTHORIZATION admin -- Criação de novo Schema, para manter o DW organizado. 

-- Create DIMENSIONS tables
-- Create stores table
CREATE TABLE dw.DIM_STORE (
    Code INT PRIMARY KEY,
    Name VARCHAR(255),
    City VARCHAR(255),
    State CHAR(2)
);

-- Create products table
CREATE TABLE dw.DIM_PRODUCT (
    SKU_Code INT PRIMARY KEY,
    Name VARCHAR(255),
    Brand VARCHAR(255),
    Category VARCHAR(255)
);

-- Create clients table
CREATE TABLE dw.DIM_CLIENT (
    Client_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    State CHAR(2)
);

-- Create sellers table
CREATE TABLE dw.DIM_SELLER (
    Registration INT PRIMARY KEY,
    Name VARCHAR(255)
);

-- Create dates table
CREATE TABLE dw.DIM_DATE(
    Full_date DATE PRIMARY KEY,
    Year_date INT,
    Month_date INT,
    Day_date INT
);

-- Create sales FACT table
CREATE TABLE dw.FACT_SALES (
    Date_ DATE,
    Product INT,
    Store INT,
    Seller INT,
    Client INT,
    Amount_sold INT,
    Total_sold DECIMAL(10,2),
    Transaction_ID INT,
    PRIMARY KEY (Date_, Product, Store, Seller, Client),
    FOREIGN KEY (Date_) REFERENCES dw.DIM_DATE(Full_date), -- With these references, the information inserted in the DIM talbe will be accessible to the FACT table. 
    FOREIGN KEY (Product) REFERENCES dw.DIM_PRODUCT(SKU_Code),
    FOREIGN KEY (Store) REFERENCES dw.DIM_STORE(Code),
    FOREIGN KEY (Seller) REFERENCES dw.DIM_SELLER(Registration),
    FOREIGN KEY (Client) REFERENCES dw.DIM_CLIENT(Client_ID)
);
```

```

-- Carrega a tabela
INSERT INTO dw.DIM_STORE (Code, Name, City, State) VALUES
(1, 'Store A', 'São Paulo', 'SP'),
(2, 'Store B', 'Rio de Janeiro', 'RJ'),
(3, 'Store C', 'Belo Horizonte', 'MG'),
(4, 'Store D', 'Curitiba', 'PR'),
(5, 'Store E', 'Porto Alegre', 'RS'),
(6, 'Store F', 'Salvador', 'BA'),
(7, 'Store G', 'Recife', 'PE'),
(8, 'Store H', 'Fortaleza', 'CE'),
(9, 'Store I', 'Brasília', 'DF'),
(10, 'Store J', 'Goiânia', 'GO');

-- Verifique se os dados foram inseridos corretamente
SELECT * FROM dw.DIM_STORE;

-- Carrega a tabela
INSERT INTO dw.DIM_PRODUCT (SKU_Code, Name, Brand, Category) VALUES
(101, 'TV UHD', 'Electron', 'Eletronics'),
(102, 'Smartphone 5G 128GB', 'TechPlus', 'Cell Phones'),
(103, 'Notebook Pro 8GB', 'TechPlus', 'IT Products'),
(104, 'Cafeteira Expresso', 'Cafex', 'Household Appliances'),
(105, 'Tênis Corrida Ultra', 'Sportex', 'Clothing'),
(106, 'Blender Compacto', 'Cafex', 'Household Appliances'),
(107, 'Camiseta Poliéster', 'Sportex', 'Clothing'),
(108, 'Mouse Sem Fio Ergonômico', 'OfficeTech', 'Accessories'),
(109, 'Fone de Ouvido Bluetooth', 'TechPlus', 'Accessories'),
(110, 'Geladeira Duplex 500L', 'Cafex', 'Household Appliances');

-- Verificação dos dados inseridos
SELECT * FROM dw.DIM_PRODUCT;

-- Carrega a tabela
INSERT INTO dw.DIM_CLIENT (Client_ID, Name, Address, City, State) VALUES
(1, 'Maria Silva', 'Rua das Flores, 123', 'São Paulo', 'SP'),
(2, 'João Souza', 'Av. Brasil, 456', 'Rio de Janeiro', 'RJ'),
(3, 'Ana Costa', 'Praça da Árvore, 789', 'Belo Horizonte', 'MG'),
(4, 'Carlos Andrade', 'Rua do Sol, 101', 'Curitiba', 'PR'),
(5, 'Fernanda Gomes', 'Av. Boa Viagem, 202', 'Recife', 'PE'),
(6, 'Lucas Martins', 'Largo dos Leões, 303', 'Porto Alegre', 'RS'),
(7, 'Patricia Lima', 'Rua das Orquídeas, 404', 'Salvador', 'BA'),
(8, 'Rafael Dias', 'Av. Central, 505', 'Brasília', 'DF'),
(9, 'Cláudia Rocha', 'Praça do Mercado, 606', 'Fortaleza', 'CE'),
(10, 'Eduardo Pereira', 'Rua da Harmonia, 707', 'Manaus', 'AM');

-- Verifique se os dados foram inseridos corretamente
SELECT * FROM dw.DIM_CLIENT;

-- Carrega a tabela
INSERT INTO dw.DIM_SELLER (Registration, Name) VALUES
(101, 'Carlos Henrique'),
(102, 'Mariana Costa'),
(103, 'João Pedro Almeida'),
(104, 'Lúcia Ferreira'),
(105, 'Rogério Silva'),
(106, 'Fernanda Lima'),
(107, 'Eduardo Martins'),
(108, 'Ana Beatriz Souza'),
(109, 'Ricardo Oliveira'),
(110, 'Patrícia Barbosa');

-- Verifique se os dados foram inseridos corretamente
SELECT * FROM dw.DIM_SELLER;

--- Carrega a tabela
INSERT INTO dw.DIM_DATE (Full_date, Year_date, Month_date, Day_date)
SELECT 
    Full_date,
    EXTRACT(YEAR FROM data) AS Year_date,
    EXTRACT(MONTH FROM data) AS Month_date,
    EXTRACT(DAY FROM data) AS Day_date
FROM generate_series('2024-01-01'::date, '2024-12-31'::date, '1 day'::interval) AS Full_date;

-- Verifique se os dados foram inseridos corretamente
SELECT * FROM dw.DIM_DATE;

-- Cria uma sequence para gerar valor sequenciais para campo de ID
CREATE SEQUENCE transaction_seq;

-- Cria função para carregar a tabela fato a partir das tabelas de dimensão
CREATE OR REPLACE FUNCTION dw.load_FACT_SALES()
RETURNS VOID AS $$
BEGIN
    -- Assegurando que pelo menos 1000 registros únicos sejam inseridos, repetindo os dados das dimensões conforme necessário
    INSERT INTO dw.FACT_SALES (Date_, Product, Store, Seller, Client, Amount_sold, Total_sold, Transaction_ID)
    SELECT
        d.Full_date,
        p.SKU_Code,
        l.Code,
        v.Registration,
        c.Client_ID,
        (RANDOM() * 10 + 1)::INT AS Amount_sold,  -- Gera quantidade vendida entre 1 e 10
        (RANDOM() * 1000 + 100)::NUMERIC(10,2) AS Total_sold,  -- Gera valor total da venda entre 100 e 1100
        nextval('transaction_seq') AS Transaction_ID -- Sequência para ID de transação
    FROM
        (SELECT Full_date, ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn FROM dw.DIM_DATE) d
        JOIN (SELECT SKU_Code, ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn FROM dw.DIM_PRODUCT) p ON MOD(d.rn, (SELECT COUNT(*) FROM dw.DIM_PRODUCT)) = p.rn % (SELECT COUNT(*) FROM dw.DIM_PRODUCT)
        JOIN (SELECT Code, ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn FROM dw.DIM_STORE) l ON MOD(d.rn, (SELECT COUNT(*) FROM dw.DIM_STORE)) = l.rn % (SELECT COUNT(*) FROM dw.DIM_STORE)
        JOIN (SELECT Registration, ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn FROM dw.DIM_SELLER) v ON MOD(d.rn, (SELECT COUNT(*) FROM dw.DIM_SELLER)) = v.rn % (SELECT COUNT(*) FROM dw.DIM_SELLER)
        JOIN (SELECT Client_ID, ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn FROM dw.DIM_CLIENT) c ON MOD(d.rn, (SELECT COUNT(*) FROM dw.DIM_CLIENT)) = c.rn % (SELECT COUNT(*) FROM dw.DIM_CLIENT)
    WHERE d.rn <= 1000;  -- Limita a inserção aos primeiros 1000 registros
END;
$$ LANGUAGE plpgsql;

-- Executa a função
SELECT dw.load_FACT_SALES();

-- Verifique se os dados foram inseridos corretamente
SELECT * FROM dw.FACT_SALES;
```




















