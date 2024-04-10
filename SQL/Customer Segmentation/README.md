PROJECT PREMISES:
1. This project is based on the [Kaggle database](https://www.kaggle.com/datasets/carrie1/ecommerce-data/data)
2. The database was uploaded on a custom PostgreSQL server, made specifically for this portfolio.

Business Scenario:
The marketing team is planning on making new marketing campaigns and for that they requested some insights from the Data team.
The main questions they wanted to gather for their campaign were:
1. What is the income per country?
2. What are the top 3 products that generated the most income by country?
3. What are the top 3 products sold by country? 

The SQL code can be found in the .SQL file in this folder.

After cleaning the dataset by correcting null values, I started generating queries to answer the questions listed by the marketing team.

1. What is the income per country? ([full table 1.csv file](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Customer%20Segmentation/images%20and%20.csv%20files/customer%20segmentation%20table%201.csv)) 

![Here's the generated table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Customer%20Segmentation/images%20and%20.csv%20files/customer%20segmentation%20table%201%20(top%205).png?raw=true)

  Only the top 5 countries are shown in this png file, but the query lists all countries. From this table we can see which markets are doing good regarding their sales and which aren't. If the marketing team aims to optimize sales in their best selling countries, the top 5 can be their target. If they're looking foward on expanding sales where the income is low, countries from 6 to 10 can be their target: the market is already stablished, but there's room for improvement. But if they want a challenge and wish to start growing a very small market, they can focus on the bottom 5 countries on the list.

2. What are the top 3 products that generated the most income by country? ([full table 2.csv file](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Customer%20Segmentation/images%20and%20.csv%20files/customer%20segmentation%20table%202.csv))

![Here's the generated table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Customer%20Segmentation/images%20and%20.csv%20files/customer%20segmentation%20table%202%20(top%205).png)

  Only the top 3 products (regarding income) for the top 5 countries are shown in this png file, but the query lists the top 3 for all countries. The items that are going to be targeted in the marketing campaign must be wiselly chosen. Thus, the table above allows the marketing team to comprehend what might be the best product by country. For the growth in new markets, the comparison between similar countries is essencial to decide the best product to target in the campaign. For optimization in well stablished markets, it can be interesting to test selling products outside the top 3 sold items or aiming to increase profit margin of the top sold items.

3. What are the top 3 products sold by country? ([full table 3.csv file](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Customer%20Segmentation/images%20and%20.csv%20files/customer%20segmentation%20table%203.csv))

![Here's the generated table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Customer%20Segmentation/images%20and%20.csv%20files/customer%20segmentation%20table%203%20(top%205).png)

  Only the top 3 products (regarding amount sold) for the top 5 countries are shown in this png file, but the query lists the top 3 for all countries. This table is of special interest, since it allows a comparison with the previous one. The marketing team can search for low profit itens and either increase the profit margin for them or select other itens to sell in their campaign. This table allows us to see special cases, such as Germany. Notice that in the second table, Germany is top 2 regarding income, but the items sold where very few, as registered in table 3. Similar markets can have have a similar pattern, which makes this comparison usefull for a marketing campaign that aims for growth in coutries where the income is low.
