select f1.x,f1.y 
from functions f1 
inner join functions f2 
on f1.x=f2.y and f2.x=f1.y 
group by f1.x,f1.y
having count(f1.x)>1 or f1.x<f1.y
order by f1.x ;
