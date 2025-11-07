--Alter, Rename Operation
--Part – A:------------------------------------------------------------------------------------------------------
--Use Deposit table of lab-1.--From the above given tables perform the following queries (ALTER, RENAME Operation):
--1. Add two more columns City VARCHAR (20) and Pincode INT.
   select * from Deposit;
   alter table Deposit
   add City varchar(20),
       pincode INT;

--2. Add column state VARCHAR(20).
  alter table Deposit
  add state varchar(20);

--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
  alter table Deposit
  alter column CNAME varchar(35);

--4. Change the data type DECIMAL to INT in amount Column.
  alter table Deposit
  alter column AMOUNT INT;

--5. Delete Column City from the DEPOSIT table.
  alter table Deposit
  drop column City;

--6. Rename Column ActNo to ANO.
   exec sp_rename 'Deposit.ACTNO', 'ANO';

--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.   exec sp_rename 'Deposit','DEPOSIT_DETAIL';--   Part – B:------------------------------------------------------------------------------------------------------
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
   select * from DEPOSIT_DETAIL;
   exec sp_rename 'Deposit_detail.ADATE','AOPENDATE';

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
  alter table DEPOSIT_DETAIL
  drop column AOPENDATE;

--3. Rename Column CNAME to CustomerName.
  exec sp_rename 'deposit_detail.CNAME','CustomerName';

--4. Add Column country.  alter table deposit_detail  add country varchar(20);--  Part – C:-----------------------------------------------------------------------------------
--Create following table using query according to the definition.  create table STUDENT_DETAIL(    Enrollment_No VARCHAR(20),    Name  VARCHAR(25),    CPI  DECIMAL(5,2),    Birthdate DATETIME  );  --  From the above given tables perform the following queries (ALTER, RENAME Operation):
   select * from STUDENT_DETAIL;

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
   alter table STUDENT_DETAIL
   add City varchar(20) NOT NULL,
       Backlog INT;

--2. Add column department VARCHAR (20) Not Null.
   alter table student_detail
   add department varchar(20);

--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
   alter table student_detail
   alter column NAME varchar(35);

--4. Change the data type DECIMAL to INT in CPI Column.
   alter table student_detail
   alter column CPI INT;

--5. Delete Column City from the student_detail table.
   alter table student_detail
   drop column City;

--6. Rename Column Enrollment_No to ENO.
   exec sp_rename 'student_detail.Enrollment_No','ENO';

--7. Change name of table student_detail to STUDENT_MASTER   exec sp_rename 'student_detail','student_master';   select * from student_master;--   DELETE, Truncate, Drop Operation
--Part – A:-------------------------------------------------------------------------------------------------
--Use Deposit_Detail table (Altered table of DEPOSIT)select * from DEPOSIT_DETAIL;--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.
 delete from deposit_detail
 where AMOUNT <= 4000;

--2. Delete all the accounts CHANDI BRANCH.
  delete from deposit_detail
  where BNAME = 'CHANDI';

--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105.
  delete from deposit_detail
  where ANO between 102 and 105;

--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’
  delete from deposit_detail
  where BNAME in('AJNI','POWAI');

--5. Delete all the accounts whose account number is NULL.
  delete from deposit_detail
  where ANO is NULL;

--6. Delete all the remaining records using Delete command.
  delete from deposit_detail;

--7. Delete all the records of Deposit_Detail table. (Use Truncate)
  truncate table deposit_detail;

--8. Remove Deposit_Detail table. (Use Drop)  drop table deposit_detail;--  Part – B:---------------------------------------------------------------------------------------
--Create following table using query according to the definition.create table employee_master(   EmpNo int,   EmpName varchar(25),   JoiningDate datetime,   Salary DECIMAL(8,2),   City VARCHAR(20));insert into employee_master(EmpNo,EmpName,JoiningDate,Salary,City)values(101,'Keyur','2005-01-02',12000.00,'Rajkot'),(102,'Hardik','2015-02-04',14000.00 ,'Ahmedabad'),(103,'Kajal','2014-03-06',15000.00,'Baroda'),(104,'Bhoomi','2023-06-05',12500.00,'Ahmedabad'),(105,'Harmit','2015-02-04',14000.00,'Rajkot'),(106,'Mitesh','2025-09-01',5000.00,'Jamnagar'),(107,'Meera',NULL,7000.00,'Morbi'),(108,'Kishan','2006-02-03',10000.00,NULL);select * from employee_master;--From the above given tables perform the following queries (DELETE Operation):
--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
   delete from employee_master
   where Salary >= 14000;

--2. Delete all the Employees who belongs to ‘RAJKOT’ city.
   delete from employee_master
   where City = 'Rajkot';

--3. Delete all the Employees who joined after 1-1-2007.
  delete from employee_master
  where joiningDate > '2007-01-01';

--4. Delete the records of Employees whose joining date is null and Name is not null.
  delete from employee_master
  where (joiningDate is NUll) and (joiningDate is NOT NULL);

--5. Delete the records of Employees whose salary is 50% of 20000.
  delete from employee_master
  where salary = 20000 * 0.5;

--6. Delete the records of Employees whose City Name is not empty.
  delete from employee_master
  where City is NOT NULL;

--7. Delete all the records of Employee_MASTER table. (Use Truncate)
  truncate table employee_master;

--8. Remove Employee_MASTER table. (Use Drop)
  drop table employee_master;