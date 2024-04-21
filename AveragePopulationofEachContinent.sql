select co.continent,floor(avg(ci.population)) as population
from city as ci
join
country as co 
on ci.countrycode=co.code
group by co.continent
