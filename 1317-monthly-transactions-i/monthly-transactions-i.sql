# Write your MySQL query statement below
select 
    insert(extract(year_month from trans_date), 5, 0, '-') as month,
    country,
    count(*) as trans_count,
    count(case when state = 'approved' then 1 end) as approved_count,
    sum(amount) as trans_total_amount,
    ifnull(sum(case when state = 'approved' then amount end),0) as approved_total_amount
from transactions
group by country, month;
  