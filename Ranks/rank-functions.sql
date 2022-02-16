--1
select
    first_name,
    last_name,
    salary,
    street_address,
    city,
    rank() over (order by salary desc) as rank
    from employees e 
        join departments d on e.department_id = d.department_id
        join locations l on d.location_id = l.location_id
/
--2 
select
    first_name,
    last_name,
    salary,
    street_address,
    city,
    dense_rank() over (order by salary desc) as rank
    from employees e 
        join departments d on e.department_id = d.department_id
        join locations l on d.location_id = l.location_id
/
--3
select
    t1.first_name,
    t1.last_name,
    t1.salary,
    t1.street_address,
    t1.city,
    t1.val_rank
    from
        (
            select first_name, last_name, salary,
                street_address,city,
                rank() over (order by salary desc) as val_rank
                from employees e 
                    join departments d on e.department_id = d.department_id
                    join locations l on d.location_id = l.location_id
        ) t1
where t1.val_rank <= 5
/
--4
select
    t1.first_name, t1.last_name, t1.salary,  t1.street_address,
    t1.city, t1.val_rank, t1.val_denserank
    from
        (
            select first_name, last_name, salary,
                street_address,city,
                rank() over (order by salary ) as val_rank,
                dense_rank() over (order by salary ) as val_denserank
                from employees e 
                    join departments d on e.department_id = d.department_id
                    join locations l on d.location_id = l.location_id
        ) t1
where t1.val_rank <= 5
/
--5
select
    department_name, count(*) as counter,
    percent_rank() over (order by count(*) desc) * 100 as rank
    from employees e 
        join departments d on e.department_id = d.department_id
group by department_name
/
--6
select
    t1.department_name,
    t1.counter,
    t1.rank
    from (
            select
                department_name,
                count(*) as counter,
                percent_rank() over (order by count(*) desc) * 100 as rank
                from employees e 
                    join departments d on e.department_id = d.department_id
                group by department_name
        )t1
where t1.rank <=25
/
--7
select
    *
    from (
            select
                department_name,
                count(*) as counter,
                percent_rank() over (order by count(*) desc) * 100 as rank,
                round(CUME_DIST() OVER (ORDER BY count(*) desc),2) as percentyl
                from employees e 
                    join departments d on e.department_id = d.department_id
                group by department_name
        )t1
/
-- 8
select
    rank(30) within group (order by count(*) desc) hipotetycznie
    from employees e join departments d on e.department_id = d.department_id
group by e.department_id
/
--9
select
    department_name, count(*) as counter,
    rank() over (order by count(*) desc) as rank,
    row_number() over (order by department_name) as row_num
    from employees e 
        join departments d on e.department_id = d.department_id
group by department_name
/
--10
select
    department_name, count(*) as counter,
    rank() over (order by count(*) desc) as rank,
    concat(' Basket ', NTILE(4) OVER (ORDER BY department_name DESC)) as basket
    from employees e 
        join departments d on e.department_id = d.department_id
group by department_name
/
--11
select
    department_name,
    job_title,
    count(*) as counter,
    rank() over (order by count(*) desc) as rank
    from employees e
        join departments d on e.department_id = d.department_id
        join jobs j on e.job_id = j.job_id
group by (department_name, job_title)
