create table stu_info(
   rno int primary key,
   name varchar(20),
   branch varchar(20)
);

insert into stu_info
values
(101, 'Raju', 'CE'), 
(102, 'Amit', 'CE' ),
(103, 'Sanjay' ,'ME'), 
(104, 'Neha' ,'EC'), 
(105, 'Meera' ,'EE'), 
(106, 'Mahesh', 'ME');

create table result(
   rno int,
   spi decimal(3,2)
);

insert into result
values (101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(107, 8.9);

create table EMPLOYEE_MASTER(
   EmployeeNo varchar(20),
   Name varchar(20),
   ManagerNo varchar(20)
);

insert into employee_master
values
('E01', 'Tarun' ,NULL),
('E02', 'Rohan' ,'E02'),
('E03', 'Priya' ,'E01'),
('E04', 'Milan' ,'E03'),
('E05', 'Jay' ,'E01'),
('E06', 'Anjana', 'E04');

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
    select * from 
    stu_info cross join result;



--2. Perform inner join on Student and Result tables.
    select * from 
    stu_info inner join result
    on stu_info.rno = result.rno;

--3. Perform the left outer join on Student and Result tables.
    select * from
    stu_info left join result
    on stu_info.rno = result.rno; 

--4. Perform the right outer join on Student and Result tables.
    select * from
    stu_info right join result
    on stu_info.rno = result.rno;

--5. Perform the full outer join on Student and Result tables.
    select * from
    stu_info full outer join result
    on stu_info.rno = result.rno;

--6. Display Rno, Name, Branch and SPI of all students.
     select stu_info.rno,stu_info.name,stu_info.branch,result.spi
     from stu_info left join result
     on stu_info.rno = result.rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
      select stu_info.rno,stu_info.name,stu_info.branch,result.spi
     from stu_info inner join result
     on stu_info.rno = result.rno
     where stu_info.branch = 'ce';


--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
     select stu_info.rno,stu_info.name,stu_info.branch,result.spi
     from stu_info inner join result
     on stu_info.rno = result.rno
     where stu_info.branch <> 'ec';



--9. Display average result of each branch.
    select stu_info.branch, avg(result.spi) as average from
    stu_info inner join result
    on stu_info.rno = result.rno
    group by stu_info.branch;
    

--10. Display average result of CE and ME branch.
    select stu_info.branch, avg(result.spi) as average from
    stu_info inner join result
    on stu_info.rno = result.rno
    where stu_info.branch = 'ce' or stu_info.branch = 'me'
    group by stu_info.branch;
    

--11. Display Maximum and Minimum SPI of each branch.
    select stu_info.branch, max(result.spi) as maximum, min(result.spi) as minimum from
    stu_info inner join result
    on stu_info.rno = result.rno
    group by stu_info.branch;

--12. Display branch wise student’s count in descending order.
    select stu_info.branch,count(name) from
    stu_info left join result
    on stu_info.rno = result.rno
    group by stu_info.branch
    order by count(name) desc;

--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
    select stu_info.branch,avg(spi) from
    stu_info inner join result
    on stu_info.rno = result.rno
    group by stu_info.branch
    order by avg(spi) asc;

--2. Display highest SPI from each branch and sort them in descending order.
    select stu_info.branch,max(spi) from
    stu_info inner join result
    on stu_info.rno = result.rno
    group by stu_info.branch
    order by max(spi) desc;

--Part – C:
--1. Retrieve the names of employee along with their manager’s name from the Employee table.
    select e.name as employee,m.name as manager from
    employee_master e inner join employee_master m
    on e.ManagerNo = m.EmployeeNo;
    

