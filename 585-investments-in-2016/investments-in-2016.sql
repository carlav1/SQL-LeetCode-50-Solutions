# Write your MySQL query statement below
select 
    round(sum(tiv_2016),2) as tiv_2016
from (select 
    tiv_2015,
    tiv_count,
    tiv_2016,
    count(*) over (partition by lat_lon) as lat_lon_count
from (select
    tiv_2015,
    count(*) over (partition by tiv_2015) as tiv_count,
    tiv_2016,
    concat(lat,",",lon) as lat_lon
from insurance) as table_input) as final_select
where tiv_count > 1 and lat_lon_count = 1;



