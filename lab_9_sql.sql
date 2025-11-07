--Part – A:
--1. Display the result of 5 multiply by 30.
   select 5*30;

--2. Find out the absolute value of -25, 25, -50 and 50.
   select abs(-25),abs(25),abs(-50),abs(50);

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
   select ceiling(25.2),ceiling(25.7),ceiling(-25.2);

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
    select floor(25.2),floor(25.7),floor(-25.2);


--5. Find out remainder of 5 divided 2 and 5 divided by 3.
   select 5 % 2, 5 % 3;

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
   select POWER(3,2), power(4,3);

--7. Find out the square root of 25, 30 and 50.
   select sqrt(25), sqrt(30), sqrt(50);

--8. Find out the square of 5, 15, and 25.
   select SQUARE(5), SQUARE(15), SQUARE(25);

--9. Find out the value of PI.
   select PI();

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
   select round(157.732,2), round(157.732,0), round(157.732,-2);

--11. Find out exponential value of 2 and 3.
   select EXP(2), EXP(3);

--12. Find out logarithm having base e of 10 and 2.
   select log(10), log(2);

--13. Find out logarithm having base b having value 10 of 5 and 100.
   select log(5,10), log(100,10);  

--14. Find sine, cosine and tangent of 3.1415.
   select sin(3.1415), cos(3.1415), tan(3.1415);

--15. Find sign of -25, 0 and 25.
    select sign(-25), sign(0), sign(25);

--16. Generate random number using function.    select rand();--    Part – B:
--Create and insert the following records in the EMP_MASTER tablecreate table EMP_MASTER(    EmpNo int,    EmpName varchar(20),    JoiningDate datetime,    Salary decimal(8,2),    Commission decimal(8,2),    City varchar(20),    DeptCode varchar(20));insert into emp_master values(101, 'Keyur', '2002-01-05', 12000.00, 4500, 'Rajkot', '3@g'),
(102, 'Hardik', '2004-02-15', 14000.00, 2500, 'Ahmedabad', '3@'),
(103, 'Kajal', '2006-03-14', 15000.00, 3000, 'Baroda', '3-GD'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 1000, 'Ahmedabad', '1A3D'),
(105, 'Harmit', '2004-02-15', 14000.00, 2000, 'Rajkot', '312A');select * from emp_master;--1. Display the result of Salary plus Commission.   select salary + commission as total   from emp_master;--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
   select ceiling(55.2), ceiling(35.7), ceiling(-55.2);

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
   select floor(55.2), floor(35.7), floor(-55.2);

--4. Find out remainder of 55 divided 2 and 55 divided by 3.
   select 55 % 2, 55 % 3;

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
   select power(23, 2), power(14, 3);

--   Part – C:
--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.
    select * from emp_master
    where (salary + commission) > 15000;

--2. Find the details of employees whose commission is more than 25% of their salary.
    select * from emp_master
    where commission > salary * 0.25;

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater
--than 15000.
    select * from emp_master
    where (year(joiningDate) < 2005) and (Salary + Commission) > 15000;


--4. Find employees whose total earnings (Salary + Commission) are at least double their salary.
   select * from emp_master
   where  (Salary + Commission) >= 2*salary;

--   String functions-----------------------------------------------------------------------------------------------
--Part – A:
--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
    select len(null), len('hello'), len('');

--2. Display your name in lower & upper case.
    select LOWER('NIRAJ'), upper('niraj');

--3. Display first three characters of your name.
   select SUBSTRING('niraj',1,3);
   --or
   select LEFT('niraj',3);

--4. Display 3rd to 10th character of your name.
   select substring('niraj thummar',3,7);

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
   select replace('abc123efg', '123', 'xyz');
      select replace('ab5ab5ab5', 'c', '5');


--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
   select ascii('a'),ascii('A'),ascii('Z'),ascii('z'),ascii('0'),ascii('9');

--7. Write a query to display character based on number 97, 65,122,90,48,57.
   select char(97), char(65), char(122), char(90), char(48), char(57);

--8. Write a query to remove spaces from left of a given string ‘hello world ‘.
   select LTRIM('hello world ');

--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
    select LTRIM(' hello world ');


--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
    select LEFT('SQL Server',4), right('SQL Server',5);

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
    select cast('1234.56' as decimal(8,2));
    select convert(decimal(8,2),'1234.56');

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
   select convert(int,10.58);
   select cast(10.5 as int);

--13. Put 10 space before your name using function.
   select space(10)+ 'Niraj';

--14. Combine two strings using + sign as well as CONCAT ().
   select 'niraj'+'thummar';
   select CONCAT('niraj','thummar');

--15. Find reverse of “Darshan”.
   select REVERSE('Niraj');

--16. Repeat your name 3 times.
   select REPLICATE('niraj', 3);

--Part – B: Perform following queries on EMP_MASTER table.
--1. Find the length of EMP Name and City columns.
   select * from emp_master;

   select LEN(EmpName) as NameLength, 
   LEN(city) as CityLength
   from emp_master;

--2. Display EMP Name and City columns in lower & upper case.
   select LOWER(empName) as name, LOWER(city) as city from emp_master;
   select upper(empName) as name, upper(city) as city from emp_master;


--3. Display first three characters of EMP Name column.
   select left(empName, 3) as name from emp_master;

--4. Display 3rd to 10th character of city column.
   select SUBSTRING(city, 3,8) from  emp_master;

--5. Write a query to display first 4 & Last 5 characters of EMP Name column.
   select left(empName,4) as first, right(empName, 5) as last from emp_master;

--Part – C: Perform following queries on EMP_MASTER table.
--1. Put 10 space before EMP Name using function.
   select space(10)+ empName as name from emp_master; 

--2. Combine EMP Name and city columns using + sign as well as CONCAT ().
   select concat(empName,' ', city) as name from emp_master;
   select empName+' '+ city as name from emp_master;


--3. Combine all columns using + sign as well as CONCAT ().
      select concat(empNo,' ',empName,' ',joiningDate,' ',salary,' ',commission,' ',city,' ',deptcode) as fullTable from emp_master;

SELECT 
    CAST(empNo AS VARCHAR) + ' ' +
    empName + ' ' +
    CAST(joiningDate AS VARCHAR) + ' ' +
    CAST(salary AS VARCHAR) + ' ' +
    CAST(commission AS VARCHAR) + ' ' +
    city + ' ' +
    CAST(deptcode AS VARCHAR) AS fullTable
FROM emp_master;



--4. Combine the result as < EMP Name > Lives in <City>.
   select empName +' '+'Lives in'+' '+ city as result from emp_master;

--5. Combine the result as ‘EMP no of < EMP Name> is <EmpNo> .
   select 'emp No of'+' '+ empName +' '+'is'+ cast(empno as varchar) from emp_master;

--6. Retrieve the names of all employee where the third character of the Name is a vowel.
   select empName from emp_master
   where SUBSTRING(empName,3,1) in ('a','e','i','o','u');

--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that
--starts with 'R'.
   select empName +' '+ cast(city as varchar) from emp_master
   where empName like '%r' and city like 'R%';