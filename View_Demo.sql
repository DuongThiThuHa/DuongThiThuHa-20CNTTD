create view view_demo as
select e.employee_id, CONCAT(e.first_name,' ',e.last_name) as full_name,e.hire_date,d.department_name,j.job_title,j.min_salary,j.max_salary 
from employees e 
join departments d on e.department_id=d.department_id
join jobs j on e.job_id = j.job_id;

select * from view_demo