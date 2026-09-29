# Write your MySQL query statement below
select employee_id
from employees
where salary <30000 and manager_Id not in (
    select employee_id
    from employees)
order by employee_id ASC
;