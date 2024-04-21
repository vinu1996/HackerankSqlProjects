with professor as
(select name,
row_number()over(order by name asc) as rp
from occupations 
where occupation LIKE '%Professor%')

,doctor as (select name,
row_number()over(order by name asc) as rd
from occupations 
where occupation LIKE '%Doctor%')

,singer as (select name,
row_number()over(order by name asc) as rs
from occupations 
where occupation LIKE '%Singer%')

,actor as (select name,
row_number()over(order by name asc) as ra
from occupations 
where occupation LIKE '%Actor%')

select d.name,p.name,s.name,a.name
from professor p
left join doctor d
on p.rp=d.rd
left join singer s
on p.rp=s.rs
left join actor a
on p.rp=a.ra;
