# Write your MySQL query statement below
select 
    employee_id,
    department_id
from (
select 
    employee_id,
    department_id,
    count(department_id) dep_count
from employee
group by employee_id
) as table_sub
where dep_count = 1 

UNION ALL

select 
    employee_id,
    department_id
from employee
where primary_flag = 'Y';