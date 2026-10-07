# Write your MySQL query statement below
with first_cte as 
(
select delivery_id,
    customer_id,
      min(order_date) as first_order
from delivery
group by customer_id
),

sec_cte as 
(
select delivery_id,
    customer_id,
    order_date,
    customer_pref_delivery_date,
    case
        when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' 
        end as delivery_type
from delivery
)

select 
    round(count(a.customer_id) / (select count(distinct customer_id) from delivery) *100, 2) as immediate_percentage
from sec_cte as a
inner join first_cte as b
on a.customer_id = b.customer_id
where delivery_type = 'immediate' and 
    first_order = order_date ;
