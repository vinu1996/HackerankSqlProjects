select TOP 1
cast(PERCENTILE_CONT ( 0.5)  
WITHIN GROUP ( ORDER BY lat_n ) OVER ( partition by null  ) as decimal(10,4)) as median
from station
