# Write your MySQL query statement below
WITH new_id AS (
    select distinct author_id as id
    from views 
    where author_id = viewer_id
    order by author_id ASC
)
select * 
from new_id;