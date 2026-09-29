# Write your MySQL query statement below
WITH cust_trans AS (
    select customer_id,
    count(visits.visit_id) as count_no_trans
    from visits
    left join transactions
        on visits.visit_id = transactions.visit_id
    where transaction_id IS NULL
    group by customer_id
)
select * 
from cust_trans;