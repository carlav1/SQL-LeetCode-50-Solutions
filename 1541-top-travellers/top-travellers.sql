# Write your MySQL query statement below
select 
    name, 
    IFNULL(sum(distance), 0) as travelled_distance
from users as a 
left join rides as b 
    on a.id = b.user_id
group by name, a.id
order by travelled_distance desc, name asc;