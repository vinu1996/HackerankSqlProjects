select c.company_code,c.founder,count(distinct l.lead_manager_code) as total_lead_managers,count(distinct s.senior_manager_code) as total_senior_manager,count(distinct m.manager_code) as total_manager,count(distinct e.employee_code) as total_employee
from 
company c inner join lead_manager l
on c.company_code=l.company_code
inner join senior_manager s 
on c.company_code=s.company_code
inner join manager m 
on c.company_code=m.company_code 
inner join employee e 
on c.company_code=e.company_code
group by 1,2
order by c.company_code;
