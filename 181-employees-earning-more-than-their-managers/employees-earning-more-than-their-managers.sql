# Write your MySQL query statement below
select 
    a.name as employee
from employee as a
inner join employee as b
on a.managerid = b.id
where a.salary > b.salary;


