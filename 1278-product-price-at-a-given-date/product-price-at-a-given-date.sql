# Write your MySQL query statement below
with cte as
(
select 
product_id,
new_price,
change_date,
row_number() over (partition by product_id order by change_date DESC) as row_count1
from products
where change_date <= '2019-08-16'
),

lookup as 
(
select distinct product_id
from products 
)

select 
l.product_id,
case 
when new_price IS NULL then 10 
else new_price end as price
from (select product_id,
new_price
from cte
where row_count1 = 1) as a
right join lookup as l
on a.product_id = l.product_id;

