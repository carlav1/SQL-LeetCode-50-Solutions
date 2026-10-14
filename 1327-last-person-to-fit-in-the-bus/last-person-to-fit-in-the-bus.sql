# Write your MySQL query statement below
with cte as 
(
select 
    turn,
    person_id,
    person_name,
    weight,
    sum(weight) over (order by turn) as prev_weight
from queue
)
select 
b.person_name
from (
select
max(turn) as turn_number
from cte
where prev_weight  <= 1000) as a 
inner join queue as b 
on a.turn_number = b.turn;
