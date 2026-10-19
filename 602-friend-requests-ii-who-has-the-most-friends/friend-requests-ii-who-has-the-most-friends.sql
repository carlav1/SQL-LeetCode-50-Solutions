# Write your MySQL query statement below
select 
    id,
    sum(num) as num
from (
select 
    requester_id as id,
    count(requester_id) as num
from requestaccepted
group by requester_id

UNION ALL 

select 
    accepter_id,
    count(accepter_id) as accept_request
from requestaccepted
group by accepter_id ) as union_table
group by id
order by num DESC
limit 1;

