--1
select
    e.*,
    (salary+(salary * NVL(commission_pct,0)))* 12 as roczny_dochod
    from employees e join jobs j on e.job_id = j.job_id
where (salary+(salary * NVL(commission_pct,0))) * 12 > 37200 and
        j.job_title in ('Accountant','Purchasing Clerk')
/
--2
select
    e.first_name,
    e.last_name,
    b.first_name as boss_first_name,
    b.last_name as boss_last_name
    from employees e, employees b
where e.manager_id = b.employee_id
/
--3
select
    e.first_name,
    e.last_name,
    b.first_name as boss_first_name,
    b.last_name as boss_last_name
    from employees e left join employees b on e.manager_id = b.employee_id
/
--4
select
    department_name,
    round(avg(salary), 2) as srednia,
    count(*) as liczba_prac
    from employees e join departments d on e.department_id = d. department_id
group by department_name
/
--5
select
    e.manager_id,
    count(*) as counter
    from employees e join employees b on e.manager_id = b.employee_id
where e.manager_id is not null
group by e.manager_id
order by counter desc
/
--6 
select
    e.first_name,
    e.last_name,
    b.first_name as boss_first_name,
    b.last_name as boss_last_name,
    e.hire_date - b.hire_date as day_diff
    from employees e join employees b on b.employee_id = e.manager_id
where e.hire_date - b.hire_date > 1000
/
--7
select
    department_name,
    sum(salary) as result
    from employees e join departments d on e.department_id = d.department_id
group by department_name
order by result desc