# Write your MySQL query statement below
select 
    product_name,
    unit_sum as unit
from
(select a.product_id,
    a.product_name,
    sum(unit) as unit_sum
from products as a
inner join orders as b
on a.product_id = b.product_id
where extract(month from order_date) = 2 and extract(year from order_date) = 2020
group by product_name) as filter_table
where unit_sum >= 100;