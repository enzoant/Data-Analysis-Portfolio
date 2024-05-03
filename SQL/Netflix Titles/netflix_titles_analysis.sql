-- Steps to be followed:

-- 1st Exploratory Data Analysis;
-- 2nd Treatment of Missing Values
-- 3rd Formulation of Questions and Extraction of Insights


-- Step 1: Exploratory Data Analysis
SELECT * FROM netflix_data.netflix_titles
LIMIT 100
;


-- Counting missing values in the dataset per column
SELECT
	COUNT(*) - COUNT(show_id) AS nulls_show_id,
	COUNT(*) - COUNT(type_) AS nulls_type_,
	COUNT(*) - COUNT(title) AS nulls_title,
	COUNT(*) - COUNT(director) AS nulls_director,
	COUNT(*) - COUNT(cast_) AS nulls_cast_,
	COUNT(*) - COUNT(country) AS nulls_country,
	COUNT(*) - COUNT(date_added) AS nulls_date_added,
	COUNT(*) - COUNT(release_year) AS nulls_release_year,
	COUNT(*) - COUNT(rating) AS nulls_rating,
	COUNT(*) - COUNT(duration) AS nulls_duration,
	COUNT(*) - COUNT(listed_in) AS nulls_listed_in,
	COUNT(*) - COUNT(description) AS nulls_description
FROM netflix_data.netflix_titles
;

-- Result: it is noted that there is a large number of missing values in 3 columns, a few in 3 columns, and none in 6 columns.
-- Thus, we will analyze case by case to verify the best approach for each of them.

-- Column "show_id": 0 missing values
-- Column "type_": 0 missing values
-- Column "title": 0 missing values
-- Column "director": 2634 missing values
-- Column "cast_": 825 missing values
-- Column "country": 831 missing values
-- Column "date_added": 10 missing values
-- Column "release_year": 0 missing values
-- Column "rating": 4 missing values
-- Column "duration": 3 missing values
-- Column "listed_in": 0 missing values
-- Column "description": 0 missing values

-- We will analyze in order and check for any discrepancies and/or strange values.

-- Column "show_id":
SELECT
	COUNT(DISTINCT(show_id)) AS unique_show_id
FROM netflix_data.netflix_titles
;

-- RESULT: the query reported the same value as the number of rows in the table. Thus, we can consider that all values in this column are unique and valid.

-- Column "type_"
SELECT
	COUNT(DISTINCT(type_)) AS unique_type_
FROM netflix_data.netflix_titles
;


SELECT
	DISTINCT(type_) AS distinct_type_
FROM netflix_data.netflix_titles
;

-- RESULT: it returned only 2 values: "Movie" and "TV Show". It has no null values or missing information.

-- Column "title"
SELECT
	COUNT(DISTINCT(title)) AS unique_title
FROM netflix_data.netflix_titles
;

-- RESULT: it returned 8807, the same number of rows in the table. No null or missing information records are expected.

-- Column "director"
SELECT
	COUNT(DISTINCT(director)) AS unique_director
FROM netflix_data.netflix_titles
;

-- RESULT: 4528 unique records were returned. There are repeated values, which makes sense for this type of variable.
-- As seen before, the number of missing values in this variable is very large. Let's check the percentage this represents of the total.
SELECT
	100*(COUNT (*) - COUNT(director)) / COUNT (*) AS percet_null_director
FROM netflix_data.netflix_titles
;

-- As a result, we have 29%, meaning this variable has 29% of its values missing.
-- In analysis, this value is considered high and it may be valid to discard it from the analysis later.
-- We will check later if it will be worth keeping it or not.

-- Column "cast_"
SELECT
	COUNT(DISTINCT(cast_)) AS unique_cast_,
	COUNT(*)-COUNT(cast_) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(cast_)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: We have 7692 unique values, with some repetitions
-- and 825 missing values representing 9% of the data in this column.
-- In this case, repeated values are uncommon. Let's check them.

SELECT
	cast_,
	COUNT(cast_) AS unique_cast_
FROM netflix_data.netflix_titles
GROUP BY cast_
HAVING COUNT(cast_) > 1
ORDER BY unique_cast_ DESC
;

-- The returned values represent valid values. There are no records like "?", "NULL", "N/A", or similar. Thus, the records are valid.
-- The repeated values in cases of multiple actors/actresses involved sometimes refer to movie sagas.
-- As for the missing values, we will determine the best approach according to the analysis to be performed.

-- Column "country"

SELECT
	COUNT(DISTINCT(country)) AS unique_country,
	COUNT(*)-COUNT(country) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(country)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: there are 831 missing values. There are many cases of international productions, so the values may be combinations of countries.
-- The null values here are a specific case of treatment, as they represent a significant portion of the category (9%).
-- The best approach to treat such null values here will be similar to that of the "cast" column. We will replace them with "Not informed",
-- as this way we keep the data from the other categories and can use the data from the column for analysis. 

-- Column "date_added"

SELECT
	COUNT(DISTINCT(date_added)) AS unique_date_added,
	COUNT(*)-COUNT(date_added) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(date_added)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: only 10 missing values and 1714 unique values. In this case, repetition is common.
-- Let's check if there is any pattern in these 10 missing values by observing the other columns.

SELECT
	*
FROM netflix_data.netflix_titles
WHERE date_added IS NULL
;

-- These 10 records present two patterns:
-- 1. They are all of type TV Show, but they are not part of the same franchise.
-- 2. There is no director information for any of them.
-- As there are few records, we can identify the mode and replace the nulls with it

SELECT
	date_added,
	COUNT(date_added)
FROM netflix_data.netflix_titles
GROUP BY date_added
ORDER BY COUNT(*) DESC
LIMIT 1
;

-- RESULT: the mode of the column is 2020-01-01. Since none of these productions have a "release_year" greater than or equal to 2020, this date is valid to be replaced.

-- Column "release_year"
SELECT
	COUNT(DISTINCT(release_year)) AS unique_release_year,
	COUNT(*)-COUNT(release_year) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(release_year)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: There are a total of 74 unique values, none of them missing. Let's search for "?", "NULL", "N/A", or similar.

SELECT
	DISTINCT(release_year)
FROM netflix_data.netflix_titles
;

-- All seem like valid years, the column looks perfect.

-- Column "rating"

SELECT
	COUNT(DISTINCT(rating)) AS unique_rating,
	COUNT(*)-COUNT(rating) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(rating)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: There are a total of 17 unique values and 4 missing. Let's check the 17 values to check their integrity. 

SELECT
	DISTINCT(rating) AS unique_rating
FROM netflix_data.netflix_titles
;

-- Most seem like valid codes, but there are three data points related to time (74min, 66min, and 84min). These seem to be errors.
-- So, let's check these records

SELECT
	*
FROM netflix_data.netflix_titles
WHERE rating IN ('74 min', '66 min', '84 min')
;

-- RESULT: As expected, these three records are filling errors and should be in the "duration" column.
-- We will need to migrate this data from one column to another soon.
-- To finish the analysis in this column, let's check the missing values for any pattern and/or correlation between them.

SELECT
	*
FROM netflix_data.netflix_titles
WHERE rating IS NULL
;

-- No pattern was found: the missing records seem to be quite independent of each other.
-- In this case, we can replace missing values in this column with a generic code like "Other".

-- Column "duration"

SELECT
	COUNT(DISTINCT(duration)) AS unique_duration,
	COUNT(*)-COUNT(duration) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(duration)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: There are a total of 220 unique values and 3 missing. Let's check the 220 values to check their integrity.

SELECT
	DISTINCT(duration) AS unique_duration
FROM netflix_data.netflix_titles
;

-- They all seem valid. Let's see if there's any pattern in these missing records.

SELECT
	*
FROM netflix_data.netflix_titles
WHERE duration IS NULL
;

-- As observed in the analysis of the previous column, the duration value was saved in the rating column for these three records.
-- In the missing values correction step, this column should be corrected before rating.


-- Column "listed_in"
SELECT
	COUNT(DISTINCT(listed_in)) AS unique_listed_in,
	COUNT(*)-COUNT(listed_in) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(listed_in)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;
-- RESULT: There are a total of 514 unique values, none of them missing. Let's search for "?", "NULL", "N/A", or similar.

SELECT
	DISTINCT(listed_in) AS unique_listed_in
FROM netflix_data.netflix_titles
WHERE listed_in IN ('?','N/A','NA','NULL','Other','Empty')
;

-- No results, at first there are no fields without information in this column.

-- Column "description"

SELECT
	COUNT(DISTINCT(description)) AS unique_description,
	COUNT(*)-COUNT(description) AS total_nulls,
	COUNT(*) AS total_count,
	100 * (COUNT(*) - COUNT(description)) / COUNT(*) AS percent_nulls
FROM netflix_data.netflix_titles
;

-- RESULT: There are a total of 8775 unique values, none of them missing. Let's search for "?", "NULL", "N/A", or similar. There are some repetitions, but this does not seem to be a problem at first.

SELECT
	DISTINCT(description) AS unique_description
FROM netflix_data.netflix_titles
WHERE description IN ('?','N/A','NA','NULL','Other','Empty')
;

-- With the Exploratory Data Analysis finished, we can move on to the next step, treating missing values.


-- Step 2: Treatment of missing values

-- The columns that need treatment are:
-- director: 2634 missing values
-- cast_: 825 missing values
-- country: 831 missing values
-- date_added: 10 missing values
-- rating: 4 missing values
-- duration: 3 missing values

-- To start our analysis, let's create a second version of the table, avoiding directly changing the database.

CREATE TABLE netflix_data.netflix_titles_v2 AS
	SELECT *
	FROM netflix_data.netflix_titles
;

-- In the case of the Director column, 29% of its values are missing. As it represents a significant part of the data, we will disregard it from our analysis.

ALTER TABLE netflix_data.netflix_titles_v2
DROP COLUMN director
;

-- For the "cast_" and "country" columns, we have 9% of all values as missing. Here the approach will be to replace such nulls with "Not informed".

UPDATE netflix_data.netflix_titles_v2
SET cast_ = 'Not informed'
WHERE cast_ IS NULL
;

UPDATE netflix_data.netflix_titles_v2
SET country = 'Not informed'
WHERE country IS NULL
;

-- For the "date_added" column, we will replace the 10 missing values with the mode of the column "2020-01-01".

UPDATE netflix_data.netflix_titles_v2
SET date_added = (  SELECT
						date_added
					FROM netflix_data.netflix_titles_v2
					GROUP BY date_added
					ORDER BY COUNT(*) DESC
					LIMIT 1
				 )
WHERE date_added IS NULL
;

-- Now we will handle the "duration" column before the "rating" column.
-- For this one, we will copy the rating values to duration and then make the rating values null.

UPDATE netflix_data.netflix_titles_v2
SET duration = rating
WHERE duration IS NULL
;

UPDATE netflix_data.netflix_titles_v2
SET rating = NULL
WHERE rating IN ('74 min', '66 min', '84 min')
;

-- Now that's done, we can proceed to treat the null values in the "rating" column.
-- After a brief study about the ratings, we will replace null values with "NR", which means "Not Rated"

UPDATE netflix_data.netflix_titles_v2
SET rating = 'NR'
WHERE rating IS NULL
;

-- Now we can run the null value analysis by column again and there will be none left:

SELECT
	COUNT(*) - COUNT(show_id) AS nulls_show_id,
	COUNT(*) - COUNT(type_) AS nulls_type_,
	COUNT(*) - COUNT(title) AS nulls_title,
	COUNT(*) - COUNT(cast_) AS nulls_cast_,
	COUNT(*) - COUNT(country) AS nulls_country,
	COUNT(*) - COUNT(date_added) AS nulls_date_added,
	COUNT(*) - COUNT(release_year) AS nulls_release_year,
	COUNT(*) - COUNT(rating) AS nulls_rating,
	COUNT(*) - COUNT(duration) AS nulls_duration,
	COUNT(*) - COUNT(listed_in) AS nulls_listed_in,
	COUNT(*) - COUNT(description) AS nulls_description
FROM netflix_data.netflix_titles_v2
;

-- The table is ready to move on to the next step: Data Analysis, question formulation, and insights extraction.

-- Step 3: Formulation of questions and extraction of insights

-- Column "type_": what is the TV Show vs Movie ratio on Netflix?

SELECT
	type_,
	COUNT(type_) AS number_of_occurrences,
	CAST(100 * (CAST(COUNT(type_) AS DECIMAL(10,2)) / (SELECT COUNT(*) FROM netflix_data.netflix_titles_v2)) AS DECIMAL(10,2)) AS percentage_of_total
FROM netflix_data.netflix_titles_v2
GROUP BY type_
;

-- Column "country": what are the top 5 countries involved in productions on Netflix?

SELECT
	countries_split,
	COUNT(countries_split) AS number_of_occurrences
FROM (	SELECT
			UNNEST(STRING_TO_ARRAY(country, ', ')) AS countries_split
		FROM netflix_data.netflix_titles_v2)
GROUP BY countries_split
HAVING countries_split <> 'Not informed'
ORDER BY number_of_occurrences DESC
LIMIT 5
;

-- Column "date_added": how many productions were added per year?

SELECT
	EXTRACT(YEAR FROM date_added) AS year_added,
	COUNT(EXTRACT(YEAR FROM date_added)) AS number_of_occurrences,
	CAST(100 * (CAST(COUNT(date_added) AS DECIMAL(10,2)) / (SELECT COUNT(*) FROM netflix_data.netflix_titles_v2)) AS DECIMAL(10,2)) AS percentage_of_total
FROM netflix_data.netflix_titles_v2
GROUP BY EXTRACT(YEAR FROM date_added)
ORDER BY number_of_occurrences DESC
;

-- Column "release_year": how many productions were made per year?

SELECT
	release_year,
	COUNT(release_year) AS number_of_productions,
	CAST(100 * (CAST(COUNT(release_year) AS DECIMAL(10,2)) / (SELECT COUNT(*) FROM netflix_data.netflix_titles_v2)) AS DECIMAL(10,2)) AS percentage_of_total
FROM netflix_data.netflix_titles_v2
GROUP BY release_year
ORDER BY number_of_productions DESC
;

-- Column "rating": what is the most frequent rating on Netflix?

SELECT
	rating,
	COUNT(rating) AS number_of_occurrences,
	CAST(100 * (CAST(COUNT(rating) AS DECIMAL(10,2)) / (SELECT COUNT(*) FROM netflix_data.netflix_titles_v2)) AS DECIMAL(10,2)) AS percentage_of_total
FROM netflix_data.netflix_titles_v2
GROUP BY rating
ORDER BY number_of_occurrences DESC
LIMIT 1
;

-- Column "duration": for "TV Show", what is the most common number of seasons? And what's the average?

-- Most common number of seasons
SELECT
	duration,
	COUNT(duration) AS number_of_occurrences,
	CAST(100 * (CAST(COUNT(duration) AS DECIMAL(10,2)) / (SELECT COUNT(*) FROM netflix_data.netflix_titles_v2)) AS DECIMAL(10,2)) AS percentage_of_total
FROM netflix_data.netflix_titles_v2
WHERE type_ = 'TV Show'
GROUP BY duration
ORDER BY number_of_occurrences DESC
;

-- Average number of seasons

SELECT
	ROUND(AVG(number_of_seasons), 2) AS average_num_seasons
FROM(SELECT
		CAST(SUBSTRING (duration FROM 1 FOR 2) AS INT) AS number_of_seasons
	FROM netflix_data.netflix_titles_v2
	WHERE type_ = 'TV Show')
;

-- Column "listed_in": what is the most common category?

SELECT
	listed_in_split,
	COUNT(listed_in_split) AS number_of_occurrences
FROM (	SELECT
			UNNEST(STRING_TO_ARRAY(listed_in, ', ')) AS listed_in_split
		FROM netflix_data.netflix_titles_v2)
GROUP BY listed_in_split
ORDER BY number_of_occurrences DESC
LIMIT 1
;

-- End of project...