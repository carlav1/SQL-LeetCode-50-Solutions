# Write your MySQL query statement below
select distinct (e.reports_to) as employee_id,
     m.name,
      count(e.reports_to) as reports_count,
    round(avg(e.age), 0) as average_age
   
    
from employees as e 
    join employees as m on
    e.reports_to = m.employee_id
where e.reports_to is not null 
group by e.reports_to
order by employee_id ASC;

