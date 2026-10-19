# Write your MySQL query statement below
with cte as 
(
select 
    visited_on,
    sum(amount) as amount
from customer
group by visited_on
)
select 
*
from (select 
    visited_on,
    sum(amount) over (order by visited_on asc rows between 6 preceding and current row) AS amount,
    round(avg(amount) over (order by visited_on asc rows between 6 preceding and current row), 2) as average_amount
from cte) as query
where visited_on >= (select min(visited_on) + interval 6 day from customer);