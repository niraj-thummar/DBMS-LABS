--Part – A:----------------------------------------------------------------------------------------------------
--Create following table using query according to the definition.
create table STUDENT(
   StuID INT,
   FirstName VARCHAR(25),
   LastName VARCHAR(25),
   Website VARCHAR(50),
   City VARCHAR(25),
   Address VARCHAR(100)
);

insert into STUDENT (StuID,FirstName,LastName,Website,City,Address)
values (1011,'Keyur','Patel','techonthenet.com','Rajkot','A-303 ''Vasant Kunj'','),
        (1022,'Hardik','Shah','digminecraft.com','Ahmedabad','"Ram Krupa", Raiya Road'),
        (1033,'Kajal','Trivedi','bigactivities.com ','Baroda','Raj bhavan plot, near garden'),
        (1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad','"Jig''s Home", Narol '),
        (1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55, Raj Residency'),
        (1066,'Ashok','Jani',NULL,'Baroda','A502, Club House Building');

        select * from student;

--        From the above given tables perform the following queries (LIKE Operation):
--1. Display the name of students whose name starts with ‘k’.
    select FirstName from student 
    where FirstName like '[Kk]%';

--2. Display the name of students whose name consists of five characters.
    select FirstName from student 
    where FirstName like '_____';

--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters.
    select Firstname,LastName from student
    where city like '_____[aA]';

--4. Display all the students whose last name ends with ‘tel’.
    select * from student 
    where lastname like '%tel';

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
    select * from student
    where firstname like 'ha%t';

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
    select * from student
    where firstname like 'k_y%';

--7. Display the name of students having no website and name consists of five characters.
   select firstname from student
   where website is NULL and firstname like '_____';

--8. Display all the students whose last name consist of ‘jer’.
   select * from student
   where lastname like '%jer%';

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
   select * from student
   where city like '[rb]%'

--10. Display all the name students having websites.
   select * from student
   where website is NOT NULL;

--11. Display all the students whose name starts from alphabet A to H.
    select * from student
   where firstname like '[a-h]%'

--12. Display all the students whose name’s second character is vowel.
    select * from student
   where firstname like '_[aeiou]%';

--13. Display the name of students having no website and name consists of minimum five characters.
   select firstname from student
   where website is NULL and firstname like '_____%';

--14. Display all the students whose last name starts with ‘Pat’.
   select * from student
   where lastname like 'pat%';

--15. Display all the students whose city name does not starts with ‘b’.
   select * from student
   where city like '[^b]%';

--16. Display all the students whose student ID ends with digit.
   select * from student 
   where stuid like '%[0-9]';

--17. Display all the students whose address does not contain any digit.
   select * from student
   where address not like '%[0-9]%';

--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either
--'math' or 'science'. Ensure that their city does not start with 'B'.
   select * from student
   where firstname like 'b%' and lastname like '%a' and city not like 'b%' and website like '%math%' or website like '%science%';

--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their
--website should be either null or contain 'com'.
   select * from student
   where (lastname like '%shah%') and (city like '%d') and (website is NULL or website like '%com%');

--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must
--have a website containing '.com'.
   select * from student
   where firstname like '[aeiou][aeiou]%' and city like 'r%' and website like '%.com%';

--   Part – B:----------------------------------------------------------------------------------------------
--1. Display all the students whose name’s second character is vowel and of and start with H.
   select * from student
   where firstname like 'h[aeiou]%';

--2. Display all the students whose last name does not ends with ‘a’.
   select * from student
   where lastname not like '%a';

--3. Display all the students whose first name starts with consonant.
   select * from student
   where firstname not like '[aeiou]%';

--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their
--website contains 'tech' or they live in a city starting with 'R'.
   select * from student
   where (firstname like 'k%' and lastname like '%tel') and (website like '%tech%' or city like 'r%');

--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They
--must have a website that ends with '.com' and their first name should not start with 'A'.
  select * from student 
  where (address like '%-%' and city like '[rb]%') and(website like '%.com' and firstname not like 'a%');

--Part – C:---------------------------------------------------------------------------------------------------
--1. Display all the students whose address contains single quote or double quote.
  select * from student
  where address like '%[''"]%';

--2. Find students whose city does not contain the letter 'S' and their address contains either single or double
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'.
  select * from student 
  where (city not like '%s%' and address like '%[''"]%') and (lastname like 'p%' and website like '%on%');

