--- Ex 01: 
SELECT Name
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME,3), ID 

--- Ex 02:1667. Fix Names in a Table -  the first character is uppercase and the rest are lowercase
SELECT 
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LENGTH(name)-1)))
FROM USERS
ORDER BY user_id

--- Ex 03: Write a query to calculate the total drug sales for each manufacturer. 
-- please format your results as follows: "$36 million".
SELECT manufacturer, 
    CONCAT('$',round(sum(total_sales)/1e6, 0) , ' million')
FROM pharmacy_sales
group by manufacturer;
order by sum(total_sales) desc, manufacturer

--- Ex 04: write a query to retrieve the average star rating for each product, grouped by month.
SELECT 
  EXTRACT(MONTH FROM submit_date),
  product_id AS Product,
  round(avg(stars),2) as Avg_stars
FROM reviews
group by 
  EXTRACT(MONTH FROM submit_date),
  product_id
order by 
  EXTRACT(MONTH FROM submit_date),
  product_id;

--- Ex 05: Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022.
SELECT sender_id,
  count(content) as message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 08 and EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY COUNT(content) desc

--- Ex 06: Write a solution to find the IDs of the invalid tweets.
SELECT tweet_id
FROM tweets
WHERE length(content) > 15

--- Ex 07: Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
SELECT activity_date,
    count(distinct user_id) as active_users
FROM Activity
WHERE activity_date = '2019-07-27' and activity_type = 'end_session'
group by activity_date

--- Ex 08: You have been asked to find the number of employees hired between the months of January and July in the year 2022 inclusive.
select 
    count(distinct id) as No_employees
from employees
where extract(month from joining_date) between 1 and 7 and 
        extract(year from joining_date) = 2022;

--- Ex 09: Find the position of the lower case letter 'a' in the first name of the worker 'Amitah'.
select 
    position('a' in first_name)
from worker
where first_name = 'Amitah';

--- Ex 10: Find the vintage years of all wines from the country of Macedonia.
-- The year can be found in the 'title' column. Output the wine (i.e., the 'title') along with the year.
select substring(title, length(winery)+2,4)
from winemag_p2
where country = 'Macedonia';





