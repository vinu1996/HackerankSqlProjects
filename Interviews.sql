with subcte as
(
select 
coll.contest_id,
sum(sub.total_submissions) as total_submissions,
sum(sub.total_accepted_submissions) as total_accepted_submissions
from colleges coll
inner join 
challenges chall
on coll.college_id=chall.college_id
inner join
Submission_Stats sub
on chall.challenge_id=sub.challenge_id
group by coll.contest_id
),
viewcte as (
SELECT coll.contest_id,
       sum(v.total_views) as total_views,
       sum(v.total_unique_views)  as total_unique_views
from colleges coll
inner join 
challenges chall
on coll.college_id=chall.college_id
inner join
view_stats v
on chall.challenge_id=v.challenge_id
group by coll.contest_id)

select cont.contest_id,cont.hacker_id,cont.name,sub.total_submissions,sub.total_accepted_submissions,vie.total_views,vie.total_unique_views
from contests cont
inner join subcte sub
on cont.contest_id=sub.contest_id
inner join viewcte vie
on cont.contest_id=vie.contest_id
where sub.total_submissions >0
or sub.total_accepted_submissions > 0
or vie.total_views > 0
or vie.total_unique_views > 0
order by cont.contest_id;
