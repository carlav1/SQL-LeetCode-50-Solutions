with start_table as (
select 
machine_id,
process_id,
activity_type,
timestamp
from activity 
where activity_type = 'start'
group by machine_id, process_id

),

end_table as (
select 
machine_id,
process_id,
activity_type,
timestamp as end_timestamp
from activity 
where activity_type = 'end'
group by machine_id, process_id
),

last_table as 
(
select a.machine_id,
a.process_id,
end_timestamp-timestamp as diff_time
from start_table as a 
inner join end_table as b 
on a.machine_id = b.machine_id and
a.process_id = b.process_id

)

select 
machine_id,
round(AVG(diff_time), 3) as processing_time
from last_table
group by machine_id;
