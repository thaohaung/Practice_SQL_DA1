-- ex1:
select a.continent, round(avg(b.population),1) as Avg_Population
from Country a
full join City b on a.code = b.countrycode
where b.population is not null and a.continent is not null
group by a.continent 

-- ex2:
SELECT 
  ROUND(COUNT(texts.email_id)
  /COUNT(DISTINCT emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
where texts.signup_action = 'Confirmed'

-- ex3: 
SELECT 
  ag.age_bucket, 
    SUM(ac.time_spent) FILTER (WHERE ac.activity_type = 'send')/
      SUM(ac.time_spent) AS send_perc, 
    SUM(ac.time_spent) FILTER (WHERE ac.activity_type = 'open')/
      SUM(ac.time_spent) AS open_perc
FROM activities ac
INNER JOIN age_breakdown ag
  ON ac.user_id = ag.user_id 
WHERE ac.activity_type IN ('send', 'open') 
GROUP BY ag.age_bucket;

-- ex4: 
select customer_id
from customer_contracts 
group by customer_id
having count(product_id) >=1
order by customer_id

-- ex5:
select e1.reports_to as employee_id,
       e2.name,
       count(e1.reports_to) as reports_count,
       round(avg(e1.age),0) as average_age
from employees e1
join employees e2
on e1.reports_to=e2.employee_id
group by e1.reports_to
order by e1.reports_to

-- ex6:
SELECT p.product_name, 
       o.unit 
FROM   (SELECT product_id, 
               Sum(unit) AS unit 
        FROM   orders 
        WHERE  order_date BETWEEN '2020-02-01' AND '2020-02-29' 
        GROUP  BY product_id 
        HAVING unit >= 100) o 
       INNER JOIN products p 
               ON o.product_id = p.product_id 

-- ex 7:
select p.page_id
from Pages p
left join Page_Likes pl on p.page_id = pl.page_id
where liked_date Is Null
