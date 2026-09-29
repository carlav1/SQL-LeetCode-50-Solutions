# Write your MySQL query statement below
select name,
    bonus
from employee as e
    left join bonus as b
    on b.empid = e.empid
    where bonus < 1000 OR 
    bonus IS NULL;
