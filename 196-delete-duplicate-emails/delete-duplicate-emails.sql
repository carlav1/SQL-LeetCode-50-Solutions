# Write your MySQL query statement below
delete a
from person as a
inner join person as b 
on a.email = b.email
    and a.id > b.id;
