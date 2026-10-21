# Write your MySQL query statement below
with cte as
(
select
    user_id,
    join_date,
    count(*) as group_by
from users as a
left join orders as b 
on a.user_id = b.buyer_id
where extract(year from order_date) = 2019
group by user_id
)
select 
    c.user_id as buyer_id,
    c.join_date,
    ifnull(group_by,0) as orders_in_2019
from users as c
left join cte as d
on c.user_id = d.user_id;