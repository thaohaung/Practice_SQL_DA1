-- Ex 01: Laptop vs. Mobile Viewership
SELECT 
  SUM(CASE WHEN DEVICE_TYPE = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN DEVICE_TYPE in ('phone', 'tablet') THEN 1 ELSE 0 END) 
    AS mobile_views
FROM viewership

-- Ex 02: Triangle Judgement
select 
    x,y,z,
    case when x + y > z then 'Yes'
        when x + z > y then 'Yes'
        when y + z > x then 'Yes'
            else 'No' end tringle
from Triangle

-- Ex 03: Patient Support Analysis
SELECT 
    round(cast((sum(case when call_category is null 
      or call_category = 'n/a' then 1 else 0 end)
          /cast(count(call_category) as float)) as numeric) ,1) *100
        as uncategorised_call_pct
FROM callers


--- Ex 04: Find Customer Referee
select 
    name
from Customer
where referee_id <> 2

--- Ex 05: Titanic
select 
    pclass, 
    sum(case when survived = 1 then 1 else 0 end) as Survived,
    sum(case when survived = 0 then 1 else 0 end) as Non-survived
from titanic
group by pclass;
