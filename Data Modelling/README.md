# Project Preview

This project will focus on the process of creating a Data Warehouse (DW), adding data to it and visualizing it's data. We well work over a fictional company, with it's activities described below. That information will be used to make the first step of the project: **the company's conceptual model for the DW**.

After a series of meetings with different sectors of the company and senior leadership, here is the general overview of the project:

_______________________________________________________________________________________________________________________________________________________________
## [Business Analysis](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/Business_Analysis_Data_Modelling_Project.pdf)

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

# Conceptual Model

From such a document, the company's main needs can be extracted. Thus, it is possible to assemble the identified entities, attributes and relationships, and thus create the following conceptual model for the Data Warehouse (DW):

## Entities and Attributes:

- Store
  - Code (Primary Key)
  - Name
  - City
  - State

- Product
  - SKU Code (Primary Key)
  - Name
  - Brand
  - Category

- Sellers
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

This conceptual model serves as a guide for building the dimensional model and logical model of the Data Warehouse (DW), facilitating data organization and carrying out analyzes and queries.

We therefore continue with the preparation of the dimensional model and the logical model.
_______________________________________________________________________________________________________________________________________________________________
# Dimensional Model

Considering the shared report and the information extracted from it, we will prepare the dimensional model.
Assumptions:
- There are no complex relationships between data and many levels.
- As it is a manufacturing network, the sales volume will probably be high and, therefore, the data volume too. In this case, better performance will be preferable.
- It was not necessary to prepare intermediate tables.

Based on the analysis of the above premises, the Star Schema approach will be adopted, as all DIMENSION tables are directly associated with the FACT table, have a simple and direct relationship between the tables (speeding up the transmission of information) and normally have superior performance.

See the image below for the dimensional model of this project.

![image](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/Dimensional%20Model.jpg)

_______________________________________________________________________________________________________________________________________________________________
# Logic Model

Based on the conceptual and dimensional models, we can create the following logical model for the Data Warehouse (DW):

Tables and Columns:

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

**Keys**:

- PK: Primary Key
- FK: Foreign Key
- NK: Natural Key

**Comments**:

- Each table has a primary key (PK) that uniquely identifies it.
- Foreign keys (FK) establish relationships between tables. For example, the "Date" column in the "FACT_SALES" table is a foreign key that references the "Full_date" column in the "DIM_DATE" table.
- The natural key is the primary key in the source, but it will only be complementary information in the DW.
- The FKs in the FATO table will form the composite primary key of the table.

This logical model represents the Data Warehouse (DW) structure at a more detailed level, defining the tables, columns and relationships that will be implemented in the database.

_______________________________________________________________________________________________________________________________________________________________
# Physical Model

Having the dimensional and logical models in hand, we can move on to preparing the Physical Model.

In a PostgreSQL system, we use pgAdmin to access the server and prepare the tables for our Data Warehouse.

The code used is as follows. The comments next to each excerpt contain instructions and/or descriptions of the various decisions made.
```
-- Portfolio Project - Physical Model
CREATE SCHEMA dw AUTHORIZATION admin -- Creation of a new Schema, to keep the DW organized.

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
_______________________________________________________________________________________________________________________________________________________________
# Extraction, Transform, Load (ETL)

Since this is a project beeing made from scratch, there is no database to extract and transform data from. Thus, I've built a SQL script to load some test data. The script can be checked [here](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/ETL.sql).
This test data was made using AI tools, data freely available in the internet and python Scripts.
_______________________________________________________________________________________________________________________________________________________________
# Database integration with PowerBI

After the integration of the Data Warehouse with PowerBI, we can start working on our analysis and dashboards for decision making, as well as answering the questions proposed by the company.

You can see in the screenshot below that the physical model has the Star Schema approach:
![file](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/DW%20Integration.png)

_______________________________________________________________________________________________________________________________________________________________
# Dashboard Creation and Insight Extraction

From the integration with PowerBI, we can prepare reports that can be generated monthly or annually for the business areas. The examples below represent a visualization version of the data based on the year 2023. If there was data from other years, it could be easily viewed using the filter.


### Income View
![income_view](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/Portfolio%20Project%20-%20Income%20View.jpg)


### Product View
![product view](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Data%20Modelling/Files/Portfolio%20Project%20-%20Product%20View.jpg)


Those dashboards will allow the decision makers for each sector to be able to track their metrics.

_______________________________________________________________________________________________________________________________________________________________
# Final Comments

This project focused on the process of creating a Data Warehouse, adding data to it and visualizing it's data. Next steps would be analysing the data with python for insight extraction and new dashboard creation to visualize it, if needed.

These next steps may be done in the future in this very same project.

Thank you for your atention to this project.

_______________________________________________________________________________________________________________________________________________________________
