-- 1. DEPARTMENT Table
CREATE TABLE DEPARTMENT (
    DID INT PRIMARY KEY,
    DName VARCHAR(50) NOT NULL UNIQUE
);

-- 2. STUDENT_DATA Table
CREATE TABLE STUDENT_DATA (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    DID INT,
    FOREIGN KEY (DID) REFERENCES DEPARTMENT(DID)
);

-- 3. ACADEMIC Table
CREATE TABLE ACADEMIC (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3,1) CHECK (SPI >= 0 AND SPI <= 10), -- SPI 0–10 ke beech hona chahiye
    BKLOG INT CHECK (BKLOG >= 0),                   -- backlog negative nahi ho sakta
    FOREIGN KEY (Rno) REFERENCES STUDENT_DATA(Rno)
);

-- DEPARTMENT Table
INSERT INTO DEPARTMENT VALUES (10, 'Computer');
INSERT INTO DEPARTMENT VALUES (20, 'Electrical');
INSERT INTO DEPARTMENT VALUES (30, 'Mechanical');
INSERT INTO DEPARTMENT VALUES (40, 'Civil');

-- STUDENT_DATA Table
INSERT INTO STUDENT_DATA VALUES (101, 'Raju', 'Rajkot', 10);
INSERT INTO STUDENT_DATA VALUES (102, 'Amit', 'Ahmedabad', 20);
INSERT INTO STUDENT_DATA VALUES (103, 'Sanjay', 'Baroda', 40);
INSERT INTO STUDENT_DATA VALUES (104, 'Neha', 'Rajkot', 20);
INSERT INTO STUDENT_DATA VALUES (105, 'Meera', 'Ahmedabad', 30);
INSERT INTO STUDENT_DATA VALUES (106, 'Mahesh', 'Baroda', 10);

-- ACADEMIC Table
INSERT INTO ACADEMIC VALUES (101, 8.8, 0);
INSERT INTO ACADEMIC VALUES (102, 9.2, 2);
INSERT INTO ACADEMIC VALUES (103, 7.6, 1);
INSERT INTO ACADEMIC VALUES (104, 8.2, 4);
INSERT INTO ACADEMIC VALUES (105, 7.0, 2);
INSERT INTO ACADEMIC VALUES (106, 8.9, 3);



--Part – A:
--1. Display details of students who are from computer department.
  select * from 
  student_data s inner join department d
  on s.did = d.did
  where Dname = (select Dname from department where Dname = 'Computer')

--2. Displays name of students whose SPI is more than 8.
   select name,spi
   from student_data s inner join academic a
   on s.Rno = a.Rno
   where spi in (select spi from academic where spi>8);

--3. Display details of students of computer department who belongs to Rajkot city.
              select * from student_data s inner join department d
              on s.did = d.did
              where s.DID in (select DID from department where Dname = 'Computer')

--4. Find total number of students of electrical department.
  select count(name) as total, Dname
  from student_data s inner join department d
  on s.did = d.did
  where d.Dname = 'Electrical'
  group by Dname;

--5. Display name of student who is having maximum SPI.
   select name, spi from 
   student_data s inner join academic a
   on s.Rno = a.Rno
   where spi = (select max(spi) from academic);

--6. Display details of students having more than 1 backlog.
   select * from student_data s inner join academic a
    on s.Rno = a.Rno
    where s.Rno in (select Rno from academic where bklog > 1)
  

--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
    
    select name,Dname
    from student_data s inner join department d
    on s.did = d.did 
    where s.DID in (select DID from department where Dname in ('mechanical','computer'))

--2. Display name of students who are in same department as 102 studying in.
    select name, Dname
    from student_data s inner join department d
    on s.did = d.did 
    where s.DID in (select did from student_data where Rno = 102)
--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
    select name
    from student_data
    where DID = (select DID from Department where Dname = 'electrical')
    and Rno in (select Rno from academic where spi > 9);


--2. Display name of student who is having second highest SPI.
    select name, spi from student_data inner join academic
    on student_data.Rno = academic.Rno
    where spi  = (select max(spi)
                    from academic
                    where spi < (select max(spi) from academic));

--3. Display city names whose students SPI is 9.2
    select city, spi from student_data inner join academic
    on student_data.Rno = academic.Rno 
    where spi = (select spi from academic where spi = 9.2);

--4. Find the names of students who have more than the average number of backlogs across all students.
    select name, bklog from student_data s inner join academic d
    on s.Rno = d.Rno 
    where s.Rno in (select Rno from academic where bklog > (select avg(bklog) from academic));


--5. Display the names of students who are in the same department as the student with the highest SPI.
     select name, Dname
     from student_data s inner join department d
     on s.DID = d.DID
     where s.DID in (
     select DID
     from student_data s
     join academic a on s.Rno = a.Rno
     where a.spi = (select max(spi) from academic)
);


create table computer(
   rollNo int,
   Name varchar(20)
)

insert into computer values
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

create table ELECTRICAL(
   rollNo int,
   Name varchar(20)
)

insert into electrical values
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


--1. Display name of students who is either in Computer or in Electrical.
    select * from computer
    union
    select * from electrical

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
    select * from computer
    union All
    select * from electrical

--3. Display name of students who is in both Computer and Electrical.
    select * from computer
    intersect
    select * from electrical


--4. Display name of students who are in Computer but not in Electrical.
    select * from computer
    except
    select * from electrical


--5. Display name of students who are in Electrical but not in Computer.
    select * from electrical
    except
    select * from computer


--6. Display all the details of students who are either in Computer or in Electrical.
    select * from computer
    union
    select * from electrical

--7. Display all the details of students who are in both Computer and Electrical.
    select * from computer
    intersect
    select * from electrical


--part B
   create table EMP_DATA(
   EID int,
   Name varchar(20)
)

insert into EMP_DATA values
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');

create table CUSTOMER(
   CID int,
   Name varchar(20)
)



insert into CUSTOMER values
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');


--1. Display name of persons who is either Employee or Customer.
   select * from emp_data
   union 
   select * from customer


--2. Display name of persons who is either Employee or Customer including duplicate data.
    select * from emp_data
   union All 
   select * from customer

--3. Display name of persons who is both Employee as well as Customer.
   select * from emp_data
   intersect 
   select * from customer
--4. Display name of persons who are Employee but not Customer.
     select * from emp_data
   except 
   select * from customer

--5. Display name of persons who are Customer but not Employee.
    select * from customer
   union 
   select * from emp_data

--Part – C:
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only.

