# Write your MySQL query statement below
with cte as 
(
select
    stock_name,
    sum(price) as buy_price
from stocks 
where operation = 'buy'
group by stock_name
),

sec_cte as 
(
select
    stock_name,
    sum(price) as sell_price
from stocks 
where operation = 'sell'
group by stock_name
)

select 
    a.stock_name,
    sell_price-buy_price as capital_gain_loss
from cte as a
inner join sec_cte as b 
on a.stock_name = b.stock_name;