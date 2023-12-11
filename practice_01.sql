--- EX1: Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME FROM CITY 
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

--- EX2: Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN' 

--- EX3: Weather Observation Station 1 - Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE FROM STATION

--- EX4: Weather Observation Station 6 - Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';

--- EX5: Weather Observation Station 7 - Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';

--- EX6: Weather Observation Station 9 - Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';

--- EX7: Employee Names - Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name FROM Employee
ORDER BY name

--- EX8: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  
-- per month who have been employees for less than  months. Sort your result by ascending
SELECT NAME FROM Employee
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID 

--- EX9: Recyclable and Low Fat Products
SELECT PRODUCT_ID 
FROM PRODUCTS
WHERE LOW_FATS = 'Y' AND RECYCLABLE = 'Y'

--- EX10: Find Customer Referee
SELECT NAME FROM CUSTOMER
WHERE REFEREE_ID IS NULL OR REFEREE_ID !=2

--- EX11: 595. Big Countries
SELECT name, population, area
FROM World
WHERE AREA >= 3000000 or POPULATION >= 25000000

--- EX12: Article Views I
SELECT distinct author_id as id
FROM Views
WHERE viewer_id = author_id
ORDER BY author_id 

--- EX13: Unfinished Parts [Tesla SQL Interview Question]
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date is null or (part = 'bumpers' and assembly_step >2);

--- EX14: Lyft Driver Wages
select * 
from lyft_drivers
where yearly_salary <= 30000 or yearly_salary >=70000;

--- EX15: Find the advertising channel where Uber spent more than 100k USD in 2019
select * from uber_advertising
where year = 2019 and money_spent > 100000;





