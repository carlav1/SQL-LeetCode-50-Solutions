# Write your MySQL query statement below
select
query_name,
round(sum(rating/position)/count(rating),2) as quality,
round(
(count(case when rating < 3 then 1 END) * 100.0) / count(rating), 2) as poor_query_percentage
from queries
group by query_name;
