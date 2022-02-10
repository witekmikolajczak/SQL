--1.
SELECT
    first_name,
    last_name,
    department_id,
    job_title,
    ROW_NUMBER()
    OVER(
        ORDER BY
            first_name
    ) AS row_count
FROM
         employees e
    JOIN jobs j USING ( job_id )
/

--2.
SELECT
    first_name,
    last_name
FROM
         employees e
    JOIN departments d USING ( department_id )
    JOIN locations   l USING ( location_id )
WHERE
    l.city IN ( 'Seattle', 'Sydney' )
/
--3.
SELECT
    first_name,
    last_name
FROM
         employees e
    JOIN departments d USING ( department_id )
    JOIN locations   l USING ( location_id )
    JOIN countries   c USING ( country_id )
    JOIN regions     r USING ( region_id )
WHERE
    region_name = 'Europe'
/
--4. 
SELECT
    e.first_name,
    e.last_name,
    j.job_title
FROM
         employees e
    JOIN jobs j ON e.salary BETWEEN j.min_salary AND j.max_salary
WHERE
    j.job_title IN ( 'Public Accountant', 'Programmer' )
/
--5.
SELECT
    first_name,
    last_name,
    l.city,
    salary
FROM
         employees e
    JOIN departments d USING ( department_id )
    JOIN locations   l USING ( location_id )
    JOIN jobs        j ON e.salary NOT BETWEEN j.min_salary AND j.max_salary
WHERE
        salary < 10000
    AND j.job_id = 'SH_CLERK'
/
--6
SELECT
    first_name,
    last_name,
    salary,
    min_salary,
    max_salary,
    job_id
FROM
         employees e
    JOIN jobs        j USING ( job_id )
    JOIN departments d USING ( department_id )
WHERE
    job_id NOT IN ( 'ST_MAN', 'SA_REP', 'FI_MGR' )
ORDER BY
    salary DESC
/
--7
select
    count(*) as counter
    from employees e join departments d using(department_id) 
    join locations l using(location_id)
    where state_province not like 'T%'