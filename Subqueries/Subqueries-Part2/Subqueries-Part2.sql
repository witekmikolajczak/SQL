--1
select
    first_name,
    last_name
    from employees e join jobs j using(job_id)
where manager_id not in (select department_id from departments d
                                where department_id = 10) and job_title = 'Programmer'
/
--2
select 
    first_name,
    last_name
    from employees e
where NOT EXISTS (select department_id
                        from employees 
                        where department_id = e.department_id)
/
--3
select
    department_id
    from employees e
having sum(salary) = ALL(select max(sum(salary)) from employees group by department_id)
group by department_id
/
--4
select
    first_name,
    last_name
    from employees e
where salary not between (select min_salary from jobs where job_title = 'Sales Representative')
                and
                (select max_salary from jobs where job_title = 'Marketing Representative')
/
                