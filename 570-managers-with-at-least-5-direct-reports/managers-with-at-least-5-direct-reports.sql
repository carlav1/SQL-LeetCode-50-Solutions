# Write your MySQL query statement below

with cte as 
(
select 
a.id,
a.name
from employee as a 
left join employee as b
on a.id = b.managerId
)
select 
name
from cte 
group by id, name
having count(id) >= 5;