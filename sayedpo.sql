select employee_id, salary
from employee_salary
where salary >(select avg(salary) from employee_salary)


select count(employee_id),sum(salary), salary
from employee_salary
group by employee_id

select D.employee_id, salary, gender
from employee_salary S
full outer join employee_demographics D
on S.employee_id = D.employee_id

where gender  = 'Male' and salary > (select avg(salary) from employee_salary)

select employee_id, salary, (select avg (salary) from employee_salary)
from employee_salary

select gender, no_employee
from (select gender, count(employee_id) AS no_employee from employee_demographics 
group by gender)


select *, ROW_NUMBER() OVER(partition by gender order by age)
from employee_demographics

select S.employee_id,S.first_name,gender, salary,
RANK() OVER(partition by gender order by salary)
from employee_salary S
INNER JOIN
employee_demographics D
on S.employee_id = D.employee_id


select *, LAG(salary) over(partition by dept_id order by salary)
from employee_salary


select *, LAG(salary,3,0) over(partition by dept_id order by salary)
from employee_salary

select *, lead(salary) over(partition by dept_id order by salary)
from employee_salary

select S.employee_id,S.first_name,gender, salary,
SUM(salary) OVER(partition by gender order by S.employee_id Asc  )
from employee_salary S
INNER JOIN
employee_demographics D
on S.employee_id = D.employee_id


select S.employee_id,S.first_name,gender, salary
--AVG(salary) OVER(partition by gender  )
from employee_salary S
left JOIN
employee_demographics D
on S.employee_id = D.employee_id
order by employee_id

select * From employee_salary where first_name like '%a%'
select * from employee_salary where dept_id is not null
order by first_name, last_name Asc

select *,
case 
     when salary < 50000 then 'calss_A'
     when salary >60000 then 'class_B'   
     else 'class_c'
end as salary_class
from employee_salary


select gender, count(employee_id)
from employee_demographics
group by gender
/*having count(employee_id) = 4"*/
;

select *
from employee_demographics


select D.employee_id, s.salary, gender,P.department_name
from employee_salary S
full outer join employee_demographics D
on S.employee_id = D.employee_id
left join parks_departments P
on s.dept_id = p.department_id
where department_name is not null

SELECT 
    d.employee_id,
    d.first_name,
    d.last_name,
    s.salary,
	s.occupation
FROM 
    employee_demographics d
LEFT JOIN 
    employee_salary s ON d.employee_id = s.employee_id;


SELECT 
    TRIM(first_name) AS trimmed_name,
	TRIM(LEADING 'L'FROM first_name),
    TRIM(TRAILING 'e'FROM first_name),
    TRIM(BOTH 'l' FROM first_name)
FROM 
    employee_demographics;
