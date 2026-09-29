# Write your MySQL query statement below
WITH lag_temp AS (
    select id,
    temperature,
    recorddate,
    lag(temperature) over (order by recorddate) as new_temp,
    lag(recorddate) over (order by recorddate) as new_date
    from weather
)
select id
from lag_temp
where temperature > new_temp AND 
datediff(recorddate, new_date) = 1;