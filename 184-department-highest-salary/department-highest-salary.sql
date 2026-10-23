# Write your MySQL query statement below
select 
    department,
    employee,
    salary
from (select 
    b.name as department,
    a.name as employee,
    salary,
    dense_rank() over (partition by b.name order by salary desc) as rank_emp
from employee as a
    inner join department as b
on a.departmentid = b.id) as rank_table
where rank_emp = 1;
