# Write your MySQL query statement below
select 
    user_id,
    time_stamp as last_stamp
from (select
    user_id,
    row_number() over (partition by user_id order by time_stamp DESC) as row_num,
    time_stamp
from (
select *
from logins
where extract(year from time_stamp) = 2020
) as user_table ) as window_table
where row_num = 1;