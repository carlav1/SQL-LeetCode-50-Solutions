# Write your MySQL query statement below
select 
    project.project_id,
    round(sum(experience_years) / count(project.employee_id), 2) as average_years
from project 
    inner join employee
    on project.employee_id = employee.employee_id 
group by 
    project_id;