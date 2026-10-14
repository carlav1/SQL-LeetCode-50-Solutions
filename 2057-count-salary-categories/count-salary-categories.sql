# Write your MySQL query statement below
with cte as 
(
select 
    count(account_id) as accounts_count,
    case
    when income  < 20000 then 'Low Salary'
    when income >= 20000 and income <= 50000 then 'Average Salary'
    when income > 50000 then 'High Salary'
    end as category
from 
accounts
group by category 
),
sec_cte as
(
select 'Low Salary' as category
union all
select 'Average Salary'
union all 
select 'High Salary'
)
select 
    b.category,
    IFNULL(accounts_count,0) as accounts_count
from cte as a 
right join sec_cte as b
on a.category = b.category
;