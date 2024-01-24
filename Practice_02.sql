-- EX 01: Query a list of CITY names from STATION for cities that have an even ID number.
SELECT DISTINCT CITY 
FROM STATION
WHERE ID % 2 = 0 

-- EX 02: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) AS DIFF
FROM STATION

-- 03: Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
-- Bai nay minh chiu
 
--EX 04: Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
SELECT ROUND(CAST(
                SUM(item_count*order_occurrences)/SUM(order_occurrences) AS DECIMAL) ,1) AS MEAN
FROM ITEMS_PER_ORDER

-- 05: Data Science Skills [LinkedIn SQL Interview Question]
-- Find candidates who are proficient in Python, Tableau, and PostgreSQL.
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3

-- 06: Write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
SELECT user_id,
      DATE(max(post_date)) - DATE(min(post_date)) AS days_between
FROM posts
WHERE post_date >= '2021-01-01' AND post_date < '2022-01-01' 
GROUP BY user_id
HAVING COUNT(post_id) >= 2;

-- 07: Write a query that outputs the name of each credit card and 
-- the difference in the number of issued cards between the month with the highest issuance cards and the lowest issuance. 
SELECT card_name, 
      max(issued_amount) - min(issued_amount) AS DIFF 
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY max(issued_amount) - min(issued_amount)

-- 08: Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and 
--- calculate the total amount of losses incurred.
SELECT manufacturer, COUNT(DRUG) AS drug_count,
      ABS(SUM(TOTAL_SALES - COGS)) AS total_loss
FROM pharmacy_sales
WHERE total_saleS < cogs
GROUP BY manufacturer
ORDER BY ABS(SUM(TOTAL_SALES - COGS)) DESC

-- 09: Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
SELECT id, movie, description, rating
FROM CINEMA
WHERE id % 2 <> 0 and description NOT LIKE '%boring%'
ORDER BY rating DESC

-- 10: Write a solution to calculate the number of unique subjects each teacher teaches in the university.
SELECT teacher_id, COUNT(distinct(subject_id)) as cnt
FROM TEACHER
GROUP BY teacher_id

-- 11: Write a solution that will, for each user, return the number of followers.
SELECT user_id, COUNT(user_id) as followers_count
FROM Followers
GROUP BY user_id
HAVING COUNT(user_id) > 0

-- 12: 
SELECT class 
FROM Courses
GROUP BY class
HAVING COUNT(student) > 5






