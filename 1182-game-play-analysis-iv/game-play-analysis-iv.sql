# Write your MySQL query statement below

with cte as 
(
select
    player_id,
    device_id,
    min(event_date) as min_date
from activity
group by player_id
),
sec_cte as 
(
select *,
IFNULL(lead(event_date) over (partition by player_id order by event_date), 0) as next_date
from activity
)

select 
round(count(a.player_id)/(select count(distinct player_id) from activity),2) as fraction
from cte as a 
inner join sec_cte as b
on a.player_id = b.player_id 
where min_date = event_date and next_date = date_add(event_date, interval 1 day);