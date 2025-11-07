
--Part – A:
--Create below table with following constraints
--1. Do not allow SPI more than 10
--2. Do not allow Bklog less than 0.
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified.
--4. Try to update SPI of Raju from 8.80 to 12.
--5. Try to update Bklog of Neha from 0 to -1
create table STU_MASTER(
   Rno int PRIMARY KEY,
   name varchar(20),
   branch varchar(20)DEFAULT 'General',
   spi decimal(2,1) check(spi <= 10),
   bklog int check(bklog >= 0)
);

insert into stu_master values
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh',NULL, 4.50, 3)


--Part – B: Create table as per following schema with proper validation and try to insert data which violate your
--validation.
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_details(Did, Dname)
--City_details(Cid, Cname)
   CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(30) NOT NULL
);

CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(30) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_details(Did),
    FOREIGN KEY (Cid) REFERENCES City_details(Cid)
);

 


--Part – C: Create table as per following schema with proper validation and try to insert data which violate your
--validation.
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did))
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)
 CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(30) NOT NULL
);

CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(30) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(30) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(30) NOT NULL,
    Did INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did)
);



--2. Insert 5 records in each table.
INSERT INTO Country VALUES (1, 'India');
INSERT INTO Country VALUES (2, 'USA');
INSERT INTO Country VALUES (3, 'UK');
INSERT INTO Country VALUES (4, 'Canada');
INSERT INTO Country VALUES (5, 'Australia');

INSERT INTO District VALUES (101, 'Ahmedabad', 1);
INSERT INTO District VALUES (102, 'Surat', 1);
INSERT INTO District VALUES (103, 'New York City', 2);
INSERT INTO District VALUES (104, 'London City', 3);
INSERT INTO District VALUES (105, 'Sydney District', 5);

INSERT INTO City_info VALUES (201, 'Maninagar', 101);
INSERT INTO City_info VALUES (202, 'Varachha', 102);
INSERT INTO City_info VALUES (203, 'Brooklyn', 103);
INSERT INTO City_info VALUES (204, 'Westminster', 104);
INSERT INTO City_info VALUES (205, 'Bondi', 105);

INSERT INTO Dept_info VALUES (301, 'Computer Science');
INSERT INTO Dept_info VALUES (302, 'Electronics');
INSERT INTO Dept_info VALUES (303, 'Mechanical');
INSERT INTO Dept_info VALUES (304, 'Civil');
INSERT INTO Dept_info VALUES (305, 'IT');

INSERT INTO Emp_info VALUES (401, 'Raju', 301, 50000, 3);
INSERT INTO Emp_info VALUES (402, 'Amit', 302, 60000, 5);
INSERT INTO Emp_info VALUES (403, 'Neha', 303, 45000, 2);
INSERT INTO Emp_info VALUES (404, 'Meera', 304, 70000, 6);
INSERT INTO Emp_info VALUES (405, 'Sanjay', 305, 55000, 4);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all
--employees.
SELECT 
    e.Ename AS EmployeeName,
    d.Dname AS DepartmentName,
    e.Salary,
    e.Experience,
    c.Cname AS City,
    dist.Dname AS District,
    co.Cname AS Country
FROM Emp_info e
JOIN Dept_info d ON e.Did = d.Did
JOIN City_info c ON c.Cid IN (201,202,203,204,205) 
JOIN District dist ON c.Did = dist.Did
JOIN Country co ON dist.Cid = co.Cid;
