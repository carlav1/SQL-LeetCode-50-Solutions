# Write your MySQL query statement below
select 
    name as Customers
from customers as a 
left join orders as b 
on a.id = b.customerid
where customerid IS NULL;