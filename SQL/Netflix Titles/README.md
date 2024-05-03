### PROJECT PREMISES:
1. This project is based on the [Kaggle database](https://www.kaggle.com/datasets/shivamb/netflix-shows)
2. The database was uploaded on a custom PostgreSQL server, made specifically for this portfolio.

### Business Scenario:
As part of the Netflix Data Analysis team, I've been requested to extract insights from their database.

The SQL code can be found in the [netflix_titles_analysis.sql](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/netflix_titles_analysis.sql) file in this folder.

After having access to the dataset, those were the project steps defined:

1º: Exploratory Data Analysis;
2º: Treatment of Missing Values;
3º: Formulation of Questions and Extraction of Insights;

The exploratory analysis was focused on (1) getting to know each column, it's patterns, values and presence or absence of null values.

The treatment of missing values happened afterwards, with a specific approach defined for each column case.

Further details on those two first steps can be found in the .sql file within the folder. Here we'll focus on the third step: Formulation of questions and extraction of insights.

### After the analysis of each category, the questions formulated were the following:

#### 1. What is the TV Show vs Movie ratio on Netflix?
Query result  ([Question_1.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_1.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_1.png)

This information is usefull to understand:
* What's the biggest part of Netflix catalogue;
* Compare with total income per Movie/TV Show and understand the proportion of income that each type has over the total income, considering the proportion they have within the netflix cataloge.

Next Steps: Understand which one is the most lucrative: movies or TV Shows.

#### 2. What are the top 5 countries involved in productions on Netflix?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_2.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_2.png)

This information is usefull to understand:
* Which countries are producing more content for Netflix as well as the original languages for them. 
* Compare with average public engagement by country, to understand which ones are engaging the most customers.

Next Steps: Understand which country is the favorite by customer segment to better divide investments.

#### 3. How many productions were added per year?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_3.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_3.png)



#### 4. How many productions were made per year?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_4.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_4.png)

OBS.: The screenshot shows only the top 5 years, but a total of 14 years were generated from the query.


#### 5. What is the most frequent rating on Netflix?
Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_5.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_5.png)

#### 6. For "TV Show", what is the most common number of seasons? And what's the average?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_1.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_1.png)


Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_2.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_2.png)



#### 7. What is the most common movie/TV Show category?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_7.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_7.png)

