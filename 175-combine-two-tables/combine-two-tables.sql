# Write your MySQL query statement below
select 
    firstname,
    lastname,
    city,
    state
from person as a
left join address as b 
on a.personid = b.personid;