# Write your MySQL query statement below
with cte as 
(
select num,
lag(num) over (order by id) as num2,
lag(num, 2) over (order by id) as num3
from logs
)

select distinct num as ConsecutiveNums
from cte 
where num= num2 and num2 = num3;