select * from person;
select * from DEPT;

--Part � A:
--1. Combine information from Person and Department table using cross join or Cartesian product.
    select *
    from person cross join dept;

--2. Find all persons with their department name
    select 
    personName,
    departmentName
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID;

--3. Find all persons with their department name & code.
   select
   personName,
   departmentName,
   departmentCode
   from person inner join dept
   on person.DepartmentID = dept.DepartmentID;




--4. Find all persons with their department code and location.
    select
    personName,
    departmentCode,
    Location
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID;



--5. Find the detail of the person who belongs to Mechanical department.
    select
    personName,
    departmentName
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID
    where DepartmentName = 'mechanical';


--6. Final person�s name, department code and salary who lives in Ahmedabad city.
    select
    personName,
    departmentCode,
    salary
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID
    where city = 'ahmedabad';

--7. Find the person's name whose department is in C-Block.
    select
    PersonName,
    Location
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID 
    where location = 'c-block';

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
    select
    PersonName,salary,DepartmentName
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID 
    where city = 'Jamnagar';

--9. Retrieve person�s detail who joined the Civil department after 1-Aug-2001.
    select
    *
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID 
    where DepartmentName = 'civil' and JoiningDate > '2001-08-01';

--10. Display all the person's name with the department whose joining date difference with the current date
--is more than 365 days.
    select
    PersonName,DepartmentName
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID 
    where DATEDIFF(day, JoiningDate, GETDATE()) > 365;

--11. Find department wise person counts.
    select
    count(personName) as total_count,
    departmentName
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID 
    group by departmentName;

--12. Give department wise maximum & minimum salary with department name.
    select
    departmentName,
    max(salary) as maximum,
    min(salary) as minimum
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID
    group by DepartmentName;


--13. Find city wise total, average, maximum and minimum salary.
    select
    city,sum(salary) as total,
    avg(salary) as avg,
    min(salary) as min,
    max(salary) as max
    from person inner join dept
    on person.DepartmentID = dept.DepartmentID
    group by city;
 

--14. Find the average salary of a person who belongs to Ahmedabad city.
    select
    personName,avg(salary) as average, city
    from person left join dept
    on person.DepartmentID = dept.DepartmentID
    where city = 'Ahmedabad'
    group by city, personName;
    

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)
   select
   personName + ' lives in '+ city + ' works in '+  DepartmentName+' department '
   from person inner join dept
   on person.DepartmentID = dept.DepartmentID 

