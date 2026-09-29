# Write your MySQL query statement below
WITH table_join AS(
    select prices.product_id,
        unitssold.units,
        unitssold.units * prices.price as unitstotal
    from prices 
    left join unitssold
        on unitssold.product_id = prices.product_id
        and purchase_date between start_date and end_date
)
select 
product_id,
round(ifnull(sum(unitstotal)/sum(units),0),2) as average_price
from table_join
group by product_id;