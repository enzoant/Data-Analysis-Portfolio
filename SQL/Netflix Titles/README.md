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

---
#### 2. What are the top 5 countries involved in productions on Netflix?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_2.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_2.png)

This information is usefull to understand:
* Which countries are producing more content for Netflix as well as the original languages for them. 
* Compare with average public engagement by country, to understand which ones are engaging the most customers.

Next Steps: Understand which country is the favorite by customer segment to better divide investments.

---
#### 3. How many productions were added per year?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_3.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_3.png)

This information is usefull to understand:
* Which years were of great growth for Netflix regarding their cataloge. 2019 and 2020 were outstanding years, that together represent almost 44% of all Movies and TV Shows in the platform (until end of semptember, 2021).

Next Steps: Understand the context of the biggest years in the table so similar approaches can be taken to keep growing.

---
#### 4. How many productions were made per year?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_4.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_4.png)

OBS.: The screenshot shows only the top 5 years, but a total of 14 years were generated from the query.

This information is usefull to understand:
* A little bit about the cinematographic context and how it's developing throughout the years. This data, however, has to be analysed carefully, since it can be biased by the marketing strategies taken by Netflix on selecting what and what not add in their cataloge.

Next Steps: From 2016 to 2020 the production of movies and TV Shows was stable and is higher then the previous five years. It'd be interesting to understand the reason behind it for a comprehesion on the market expectations.

---
#### 5. What is the most frequent rating on Netflix?
Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_5.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_5.png)

This information is usefull to understand:
* Knowing the most frequent rating, we know the public that is the target for the biggest part of the content.

Next Steps: In this case, the TV-MA is the most frequent rating, with a total of 36% of all cases. This information can be used as support for other metrics and to reinforce the main audience of the platform: adults.

---
#### 6. For "TV Show", what is the most common number of seasons? And what's the average?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_1.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_1.png)

This information is usefull to understand:
* The most common lenth of the TV Shows in Netflix. In this case, its 1 season.

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_2.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_6_2.png)

Next Steps: just because the most frequent value is 1 season and the average doesn't go far from that, it doesn't mean that those are the success cases. Thus, further research on success rate per season size is needed.

---
#### 7. What is the most common movie/TV Show category?

Query result  ([Question_2.csv](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_7.csv)):

![Table from the query](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/SQL/Netflix%20Titles/Images%20and%20.CSV%20files/Question_7.png)

This information is usefull to understand:
* The biggest genre that is currently in Netflix.

Next Steps: This information is complementary to other information and might be used to support other metrics. For instance, since the biggest category on Netflix is currently "International Movies", we can go into further detail on the countries list and see which might be the growing countries and see the categories whithin each one.


### Conclusion

This project aimed to extract insights from the dataset and build on future steps for the Netflix Data Analysis team work on. This project was fully made by Enzo Antonello and the main focus was to practice SQL and analitical thinking.

Thank you for your time!
