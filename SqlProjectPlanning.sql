with Project_start as
(
select start_date,
rank()over( order by start_date)  as rs
from Projects
where start_date not in(select end_date from Projects)
),    
Project_end as(
select end_date,
rank()over( order by end_date)  as re    
from Projects
where end_date not in(select start_date from Projects)
)
select ps.start_date, pe.end_date
from project_start ps
inner join 
project_end pe
on ps.rs=pe.re
order by datediff(day,ps.start_date,pe.end_date) asc,ps.start_date asc


 
