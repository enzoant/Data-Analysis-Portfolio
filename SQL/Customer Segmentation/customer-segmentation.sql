-- These were the steps taken to answer those three questions:
-- 1º >> Analyse the dataset.

-- Step 1: take a general view of the dataset, check it's columns, lines and values.

SELECT * FROM customer_segmentation.sales
-- LIMIT 100 here is important if we're dealing with large datasets. In this case it's not needed, but it's good to have the practice to use it.
LIMIT 100
;

-- Step 2: Verify if the column "country" have any repeated or invalid name
SELECT
  DISTINCT(country)
FROM customer_segmentation.sales
;
-- Result: all distinct items seems valid for our analysis.

-- Step 3: Identify null values for all columns

SELECT
	(COUNT (*) - COUNT(invoiceno)) AS null_invoiceno,
	(COUNT (*) - COUNT(stockcode)) AS null_stockcode,
	(COUNT (*) - COUNT(description)) AS null_description,
	(COUNT (*) - COUNT(quantity)) AS null_quantity,
	(COUNT (*) - COUNT(invoicedate)) AS null_invoicedate,
	(COUNT (*) - COUNT(unitprice)) AS null_unitprice,
	(COUNT (*) - COUNT(customerid)) AS null_customerid,
	(COUNT (*) - COUNT(country)) AS null_country
FROM customer_segmentation.sales
;
-- Result: Two columns presented null values (description and customerid)

-- Step 4: Since two columns presented null values (description and customerid), it's good to know how many they are.
-- The query below will show us the percetage of null values for each column.

SELECT
	ROUND((100 * (CAST((COUNT(*) - COUNT(description)) AS DECIMAL (10,2)))/COUNT(*)), 2) AS percentage_null_description,
	ROUND((100 * (CAST((COUNT(*) - COUNT(customerid))  AS DECIMAL (10,2)))/COUNT(*)), 2) AS percentage_null_customerid
FROM customer_segmentation.sales
;
-- Result: 0,27% null values for "description" column and 24,93% for "customerid" column. 

-- 2º >> Clean null values from the dataset.

-- Let's treat those null values. Since both columns are descriptive information, we can replace null values for "Other" in the "description" column and "99999" for the customerid column.
-- Also, we'll save all this query on a View, to make the access easier in the future. If the database was too big, it'ld be better to make it as a Materialised view and update it from time to time.

CREATE VIEW customer_segmentation.sales_wo_null AS
SELECT
	invoiceno,
	stockcode,
	CASE
		WHEN (description IS NULL) THEN 'OTHER'
		ELSE description
	END	AS null_description,
	quantity,
	invoicedate,
	unitprice,
	CASE
		WHEN (customerid IS NULL) THEN 99999
		ELSE customerid
	END	AS null_customerid,
	country
FROM customer_segmentation.sales
;

-- Now that we have our dataset cleaned, we can proceed to answer the questions using this clean view.

-- 3º >> Answer the first question: What is the income per country?

SELECT
	country,
	SUM(quantity*unitprice) AS total_income
FROM sales_wo_null
GROUP BY country
ORDER BY total_income DESC
;
-- RESULT: From this query, we can see that the main countries regarding income are "United Kingdom", "Netherlands" and "EIRE" (Ireland).
-- At this point, it'ld be important to comparte the expenses with the income by country to understand wheter the profit margin by country is within, above or below the expected.
-- That should guide the marketing team into strategies for their biggest markets.
-- If all profit margins are at a good level and the MKT team wants to make the sales grow in other countries, they can use the next question to make evaluate what's the best product to invest in their campaigns.

-- 4º >> Answer the second question: Which products generated the most income by country?

SELECT rank_sales, country, description, total_income 
FROM (
  SELECT 
	null_description AS description,
	SUM(total_income) AS total_income,
	RANK() OVER (PARTITION BY country ORDER BY SUM(total_income) DESC) AS rank_sales,
	country
  FROM (
  	SELECT
  	null_description,
  	quantity,
  	unitprice,
  	(quantity*unitprice) AS total_income,
  	country
  	FROM sales_wo_null)
GROUP BY country, null_description
ORDER BY country ASC, total_income DESC)
WHERE rank_sales < 4
;

-- RESULT: With this query, we can see the items that generated the biggest income by country. Therefore, the MKT team can compare similar markets to see if those items match.
-- If one of those markets are not doing so good, they can either focus their strategy on the items that are generating income in the other country or review the strategy to the products that are not doing so good.

-- 5º >> Answer the third question: What are the top 3 products sold by country? 
SELECT rank_sales,country, description, top_sales 
FROM (SELECT 
	null_description AS description,
	SUM(quantity) AS top_sales,
	RANK() OVER (PARTITION BY country ORDER BY SUM(quantity) DESC) AS rank_sales,
	country
FROM sales_wo_null
GROUP BY country, null_description
ORDER BY country ASC, top_sales DESC)
WHERE rank_sales < 4
;

-- RESULT: This query is similar to the previous one, but instead of analysing income, it analyses the amount of products sold.
-- This can give the markting team a view over items that might be selling a lot, but aren't generating much income and or profit. Thus, those items might not be a good target to their strategies.
