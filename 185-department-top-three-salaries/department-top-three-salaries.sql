# Write your MySQL query statement below
 select 
    b.name as Department, 
    a.name as Employee,
    salary as Salary
 from (select 
    departmentid,
    name,
    salary,
    dense_rank() over (partition by departmentid order by salary desc) as rank_num    
from employee) as a 
inner join department as b 
    on a.departmentid = b.id
where rank_num <=3;