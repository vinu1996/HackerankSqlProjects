with chal as (
select hacker_id,
count(challenge_id) as num_challenges
from challenges
group by hacker_id),

tbl_num_challenges as(
select h.name,ch.hacker_id,ch.num_challenges
from 
hackers h
inner join
chal ch
on h.hacker_id=ch.hacker_id),

tbl_count_challenges as (
select num_challenges,
count(num_challenges) as count_challenges
from tbl_num_challenges
group by num_challenges
)


select tnc.hacker_id,tnc.name,tnc.num_challenges
from tbl_num_challenges tnc
inner join 
tbl_count_challenges tcc
on tnc.num_challenges=tcc.num_challenges
where tcc.count_challenges <=1
or
tnc.num_challenges=(select max(num_challenges) from tbl_num_challenges)
order by tnc.num_challenges desc,tnc.hacker_id asc;
