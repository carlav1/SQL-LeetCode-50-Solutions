# Write your MySQL query statement below
select 
    email
from (select
    email,
    count(email) as email_count
from person 
group by email) as group_table
where email_count > 1;