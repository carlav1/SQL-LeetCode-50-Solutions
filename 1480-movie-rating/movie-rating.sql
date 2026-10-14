# Write your MySQL query statement below
select 
    name as results 
from (
select 
    name,
    count(rating) as rating_count
from movierating as a
inner join users as b
on a.user_id = b.user_id
group by a.user_id, name
order by rating_count desc, name asc
limit 1) as user_table
union all
select 
title as results
from(
select 
    title,
    avg(rating) as avg_rating
from movierating as a 
inner join movies as b 
on a.movie_id = b.movie_id
where extract(month from created_at) = 02
and extract(year from created_at) = 2020
group by a.movie_id, title
order by avg_rating desc, title asc
limit 1) as movie_table;