-- 1)
select concat(first_name, ' ', last_name) as fullname
from employees
where birth_date between '1955-01-01' and '1960-12-31' and gender = 'M'  and (last_name like '%os' or first_name like '%os');

-- 2)
select distinct dept_name
from (departments d join dept_emp demp on d.dept_no = demp.dept_no) join employees emp on emp.emp_no = demp.emp_no
where last_name like 'Y%' or last_name like 'X%';

-- 3)
select dept_name, max(from_date)
from current_dept_emp cdemp  join departments d  on d.dept_no = cdemp.dept_no
group by dept_name;

-- 4)
select first_name, last_name, max(salary)
from ((departments d join current_dept_emp cdemp on cdemp.dept_no = d.dept_no ) 
join employees emp on emp.emp_no = cdemp.emp_no) 
join salaries sal on emp.emp_no = sal.emp_no
where dept_name = 'Production';

-- 5)
select emp.*
from (departments d join dept_emp demp on d.dept_no = demp.dept_no) join employees emp on emp.emp_no = demp.emp_no
where dept_name ='Development' or dept_name = 'Research' 
group by emp.emp_no
having count(emp.emp_no) > 1;

-- 6)
select last_name, first_name
from (departments d join dept_emp demp on demp.dept_no=d.dept_no  ) join employees emp on emp.emp_no = demp.emp_no
where dept_name = 'Finance' and emp.emp_no not in (select emp_no
from dept_emp 
group by emp_no
having count(emp_no) > 1)
order by last_name, first_name;

-- 7)
select  emp.*
from titles   join employees emp on emp.emp_no = titles.emp_no
where title like '%Engineer'
group by emp.emp_no
having count(emp.emp_no) = 3;

-- 8)
Select emp.*
from employees emp join titles on emp.emp_no = titles.emp_no
where title = 'Senior Engineer' and emp.last_name not in (select emp.last_name
from employees emp join titles on emp.emp_no = titles.emp_no
where title = 'Assistant Engineer' )
order by birth_date desc;

-- 9)
select e1.emp_no, last_name, hire_date,de1.dept_no
from employees e1 join dept_emp de1 on e1.emp_no=de1.emp_no 
where (de1.dept_no,e1.hire_date) IN 
 (SELECT  de2.dept_no,e2.hire_date
  from employees e2 join dept_emp de2 on e2.emp_no=de2.emp_no 
  WHERE e2.emp_no <> e1.emp_no)
order by hire_date,dept_no;

-- 10)
select dept_name
from current_dept_emp cdemp join departments d on  
d.dept_no = cdemp.dept_no
group by dept_name
order by count(emp_no) desc
LIMIT 1;