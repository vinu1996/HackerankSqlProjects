WITH max_score AS(
    
    select challenge_id,hacker_id,max(score) as maximum 
    from submissions  
    GROUP BY challenge_id,hacker_id
)
select h.hacker_id,h.name,sum(m.maximum) as total_score
from hackers h 
inner join
max_score m
on h.hacker_id=m.hacker_id
group by h.hacker_id,h.name
having sum(m.maximum) > 0
order by total_score desc, h.hacker_id asc;
