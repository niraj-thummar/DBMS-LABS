create table EMP(
   EID int,
   EName varchar(20),
   Department varchar(20),
   Salary DECIMAL (8,2),
   JoiningDate datetime,
   City varchar(20),
   Gender varchar(20)
);

insert into emp 
values(101,'Rahul','Admin',56000,'1990-01-01','Rajkot','Male'),
      (102,'Hardik','IT',18000,'1990-09-25','Ahmedabad','Male'),
      (103,'Bhavin','HR',25000,'1991-05-14','Baroda','Male'),
      (104,'Bhoomi','Admin',39000,'1991-02-08','Rajkot','Female'),
      (105,'Rohit','IT',17000,'1990-07-23','Jamnagar','Male'),
      (106,'Priya','IT',9000,'1990-10-18','Ahmedabad','Female'),
      (107,'Bhoomi','HR',34000,'1991-12-25','Rajkot','Female');

      select * from emp;
      
--  1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
      select max(Salary) as highest,
      min(Salary) as minimum
      from emp;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.
      select sum(salary) as Total_Sal,
      avg(salary) as Average_Sal
      from emp;

--3. Find total number of employees of EMPLOYEE table.
      select count(ename) as total_emp
      from emp;

--4. Find highest salary from Rajkot city.
      select max(salary) as highest
      from emp
      where city = 'rajkot';

--5. Give maximum salary from IT department.
       select max(salary) as highrst
       from emp
       where department = 'it';

--6. Count employee whose joining date is after 8-feb-91.
      select count(ename) as emp_count
      from emp
      where joiningdate > '1991-02-08';

--7. Display average salary of Admin department.
      select avg(salary) as average
      from emp
      where department = 'admin';

--8. Display total salary of HR department.
     select sum(salary) as HP_total_salary
     from emp
     where department = 'hr';

--9. Count total number of cities of employee without duplication.
    select count(distinct city) as without_duplicate
    from emp;

--10. Count unique departments.
    select count(distinct department) as dep
    from emp;

--11. Give minimum salary of employee who belongs to Ahmedabad.
    select min(salary) as maximum
    from emp
    where city = 'Ahmedabad';

--12. Find city wise highest salary.
    select city,max(salary) as maximum
    from emp
    group by city;

--13. Find department wise lowest salary.
    select department,min(salary) as minimum
    from emp
    group by department;

--14. Display city with the total number of employees belonging to each city.
    select city,count(ename) as total
    from emp
    group by city;

--15. Give total salary of each department of EMP table.
    select department,sum(salary) as total
    from emp
    group by department;

--16. Give average salary of each department of EMP table without displaying the respective department
--name.
     select avg(salary) as average
     from emp
     group by department;

--17. Count the number of employees for each department in every city.
     select department,city,count(ename)
     from emp
     group by department,city;

--18. Calculate the total salary distributed to male and female employees.
     select Gender, sum(salary) as distributed123
     from emp
     group by Gender;

--19. Give city wise maximum and minimum salary of female employees.
     select city, max(salary) as maximum,
     min(salary) as minimum
     from emp
     where gender = 'female'
     group by city;

--20. Calculate department, city, and gender wise average salary.
     select department, city, gender, avg(salary) as average
     from emp
     group by department,city,gender;

--Part – B:------------------------------------------------------------------------------------------
--1. Count the number of employees living in Rajkot.
    select count(ename) as total
    from emp
    where city = 'rajkot';
 
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
    select max(salary)-min(salary) as diff
    from emp;

--3. Display the total number of employees hired before 1st January, 1991.
     select count(ename) as total
     from emp
     where joiningdate < '1991-01-01';

--Part – C:-------------------------------------------------------------------------------------------
--1. Count the number of employees living in Rajkot or Baroda.
     select count(ename) as total
     from emp
     where city in('rajkot','baroda');

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
    select count(ename) as total
    from emp
    where joiningdate < '1991-01-01' and department = 'it';

--3. Find the Joining Date wise Total Salaries.
     select joiningdate,sum(salary) as total
     from emp
     group by joiningdate;
 
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
     select department,city,max(salary) as maximum
     from emp
     where city like 'r%'
     group by department,city;


