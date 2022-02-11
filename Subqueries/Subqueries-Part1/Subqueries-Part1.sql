--1
SELECT
    first_name,
    last_name,
    job_title
FROM
         employees e
    JOIN jobs j USING ( job_id )
WHERE
    job_title IN (
        SELECT
            job_title
        FROM
                 employees e
            JOIN jobs j USING ( job_id )
        WHERE
            last_name = 'Hunold'
    )
/
--2
SELECT
    *
FROM
    employees
WHERE
    hire_date = (
        SELECT
            MIN(hire_date)
        FROM
            employees
        WHERE
            job_id = 'FI_ACCOUNT'
    )
/
--3
SELECT
    first_name,
    last_name,
    department_id,
    hire_date
FROM
    employees
WHERE
    ( department_id, hire_date ) IN (
        SELECT
            department_id, MIN(hire_date)
        FROM
            employees
        GROUP BY
            department_id
    )
/
--4
select
    job_id,
    job_title,
    min_salary,
    max_salary
    from employees e join departments d using(department_id) join jobs j using(job_id)
where department_name not in (select department_name
                                from departments 
                                where department_name = 'MARKETING')
group by
    (job_id,
    job_title,
    min_salary,
    max_salary)
/
--5
select 
    first_name,
    last_name,
    salary
    from employees e join departments d on e.department_id = d.department_id
where salary > (select avg(salary)
                    from employees
                    where department_id = e.department_id)
/
--6
select
    first_name,
    last_name,
    salary
    from employees e
where salary > (select (salary*0.75) 
                        from employees
                        where employee_id = e.manager_id)