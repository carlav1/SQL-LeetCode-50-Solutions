# Write your MySQL query statement below
with cross_join as (
    select
        student_name as cross_name,
        student_id as cross_id,
        subject_name as cross_sub
    from students as s 
    cross join subjects as sub
),
ex_join as (
    select 
    student_id,
    subject_name,
    count(*) as attended_exams
    from examinations
    group by student_id, subject_name
)
select cross_id as student_id,
    cross_name as student_name,
    cross_sub as subject_name, 
    IFNULL(attended_exams, 0) as attended_exams
    from cross_join
        left join ex_join
        on cross_join.cross_id = ex_join.student_id
        and cross_join.cross_sub = ex_join.subject_name
    order by student_id, subject_name;

