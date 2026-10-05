# Write your MySQL query statement below
with con_table as 
(
select 
a.user_id,
count(action) as count_confirmed
from signups as a 
left join confirmations as b
on a.user_id = b. user_id
where action = 'confirmed'
group by user_id
),

all_table as 
(
select
count(*) as count_all,
a.user_id
from signups as a 
left join confirmations as b
on a.user_id = b. user_id
group by user_id
)

select
c.user_id,
round(IFNULL(count_confirmed/count_all,0),2) as confirmation_rate
from all_table as c
left join con_table as d
on c.user_id = d.user_id;



