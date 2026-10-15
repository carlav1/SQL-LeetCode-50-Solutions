# Write your MySQL query statement below
select(
select 
    salary
from (
select 
    id,
    salary,
    dense_rank() over (order by salary desc) as rank_num
from employee) as rank_table
where rank_num =2
limit 1) as SecondHighestSalary;
