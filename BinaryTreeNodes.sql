select b.n,
CASE
    WHEN b.p IS NOT NULL then
         CASE
           WHEN (select count(*) from BST where P=b.n)=0 THEN 'Leaf'
           else 'Inner'
         END
    ELSE 'Root'
    end as                        NodeName
FROM BST b  
order by b.n;
