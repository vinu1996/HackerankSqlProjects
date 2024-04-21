with min_coins as(
select id,code,coins_needed,power,
row_number()over(partition by code, power order by code,power,coins_needed asc ) as r
from wands
)
select m.id,wp.age,m.coins_needed,m.power 
from
min_coins m
inner join
wands_property wp
on m.code=wp.code
where wp.is_evil=0 and m.r=1
order by m.power desc,wp.age desc
