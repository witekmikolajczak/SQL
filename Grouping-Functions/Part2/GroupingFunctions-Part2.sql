--1
select 
    department_id,
    count(first_name)
    from employees
group by department_id
order by department_id desc
/
--2
select 
    department_id,
    count(first_name)
    from employees
having count(first_name) > 10
group by department_id
order by department_id desc
/
--3
select
    job_id,
    department_id,
    round(avg(salary)) as avg,
    max(salary) as max
    from employees
where job_id in('IT_PROG','SA_REP')
group by job_id, department_id
order by department_id desc
/
--4
select
    extract(year from hire_date) as year,
    extract(month from hire_date) as month,
    count(first_name) as counter
    from employees
group by (
            extract(year from hire_date),
            extract(month from hire_date)
        )
order by year desc
/
--5
select
    length(concat(first_name,last_name)) as number_of_char,
    count(*)
    from employees
group by length(concat(first_name,last_name))
order by number_of_char desc