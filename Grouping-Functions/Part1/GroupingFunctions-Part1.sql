--1
select
    max(salary) as max,
    min(salary) as min,
    max(salary) - min(salary) as diff
    from employees
/
--2
select
    j.job_id,
    avg(salary)
    from jobs j join employees e on e.job_id = j.job_id
group by j.job_id
/
--3
select
    e.job_id,
    count(e.job_id) as counter
    from jobs j join employees e on j.job_id = e.job_id
where j.job_id in 'IT_PROG'
group by j.job_id
/
--4
select 
    e.department_id,
    sum(salary + (nvl(commission_pct,0)*salary)) as sum
    from employees e join departments d on e.department_id = d.department_id
group by e.department_id
/
--5
select
    manager_id,
    min(salary) as min
    from employees
where manager_id in( 
                    select employee_id
                    from employees 
                    )
group by manager_id
order by min desc
/
--6
select 
    job_id,
    sum(salary) + 2*max(department_id) as result
    from employees
group by job_id
/
--9
select
    max(salary) as max,
    min(salary) as min
    from employees
    where extract(year from hire_date) < 2000 and manager_id in (100,130)
