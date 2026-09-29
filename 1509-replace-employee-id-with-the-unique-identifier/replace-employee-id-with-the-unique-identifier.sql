# Write your MySQL query statement below
select unique_id, name
from employees
left join employeeuni 
on employeeuni.id=employees.id;
