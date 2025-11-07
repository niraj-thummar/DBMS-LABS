USE CSE_3A_114;
CREATE TABLE CRICKET(
   NAME VARCHAR(20),
   CITY VARCHAR(20),
   AGE INT
);

INSERT INTO CRICKET(NAME, CITY, AGE) 
VALUES
('Sachin Tendulkar','Mumbai',30),
('Rahul Dravid','Bombay',35),
('M. S. Dhoni ','Jharkhand',31),
('Suresh Raina','Gujarat',30);

SELECT * FROM CRICKET;

--Part – A: 
--1. Create table Worldcup from cricket with all the columns and data.
   SELECT * INTO WORLDCUP FROM CRICKET;
   SELECT * FROM WORLDCUP;

--2. Create table T20 from cricket with first two columns with no data.
   SELECT NAME, CITY INTO T20 
   FROM CRICKET
   WHERE 1=2;
   SELECT * FROM T20;

--3. Create table IPL From Cricket with No Data.
   SELECT * INTO IPL 
   FROM CRICKET 
   WHERE 1=2;

--4. Select players who are either older than 30 and from 'Mumbai' or exactly 31 years old and not from
--'Bombay', and insert them into a new table PLAYER.
   SELECT * INTO PLAYER FROM CRICKET 
   WHERE (AGE>30 AND CITY = 'Mumbai') OR (AGE = 31 AND CITY != 'Bombay');
   
   SELECT * FROM PLAYER;


--5. Select players whose age is a prime number or their city belongs to India Country, and insert them into
--a new table PLAYER_INFO. (Consider Cricketer age between 18 to 55)
   SELECT * INTO PLAYER_INFO FROM CRICKET WHERE (AGE IN(19,23,29,31,37,41,43,47,53)) OR
   CITY IN ('Mumbai','Bombay','Jharkhand','Gujarat');

--6. Select players whose age is a multiple of 5 and insert them into a new table PLAYER_DATA.
   SELECT * INTO PLATER_DATA FROM CRICKET WHERE AGE % 5 = 0;

   SELECT * FROM PLATER_DATA;

--7. Insert the cricketer into IPL table whose city is ‘Jharkhand’
   INSERT INTO IPL 
   SELECT * FROM CRICKET WHERE CITY = 'Jharkhand';

   --Part – B:---------------------------------------------------------------------------------------------------------------
   CREATE TABLE EMPLOYEE(
       Name VARCHAR(20),
       City VARCHAR(20),
       Age  INT
    );

    INSERT INTO EMPLOYEE(Name, City, Age) VALUES
    ('Jay Patel','Rajkot',30),
     ('Rahul Dave','Baroda',35),
      ('Jeet Pate','Surat',31),
       ('Vijay Raval','Rajkot',30);

       SELECT * FROM EMPLOYEE;

       --1. Create table Employee_detail from Employee with all the columns and data.
           SELECT * INTO Employee_detail FROM EMPLOYEE;

       --2. Create table Employee_data from Employee with first two columns with no data.
           SELECT Name, City INTO  Employee_data FROM Employee where 1=2;

       --3. Create table Employee_info from Employee with no Data
           SELECT * INTO  Employee_info FROM Employee where 1=2;


     --Part – C:
     --Perform following queries on Employee table.
     --  1. Insert the Data into Employee_info from Employee whose CITY is Rajkot
           insert into Employee_info 
           select * from Employee
           where CITY = 'Rajkot';
      
     --  2. Insert the Data into Employee_info from Employee whose age is more than 32.
            insert into Employee_info 
            select * from Employee
            where AGE > 32;


 
-- Update Operation-------------------------------------------------------------------------------------------------------
--Part – A:-----------------
--From the above given tables perform the following queries (UPDATE Operation):
--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)
    update Deposit
    set amount = 5000
    WHERE amount = 3000;

    select * from Deposit;

--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
select * from Borrow;

    update Borrow
    set BNAME = 'C.G. ROAD'
    where CNAME = 'ANIL';

--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)
     update Deposit
     set ACTNO = 111, 
         AMOUNT = 5000
     where CNAME = 'SANDIP';

--4. Update amount of KRANTI to 7000. (Use Deposit Table)
     update Deposit
     set AMOUNT = 7000
     where CNAME = 'KRANTI';

--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
      select * from Branch;

     UPDATE Branch
     set BNAME = 'ANDHERI WEST'
     where BNAME = 'ANDHERI';
 
--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table)
     update Deposit
     set BNAME = 'NEHRU PALACE'
     where CNAME = 'MEHUL';

--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit
--Table)
     update Deposit
     set AMOUNT = 5000
     where ACTNO BETWEEN 103 AND 107;

--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table)
     update Deposit
     set ADATE = '1995-04-01'
     where CNAME = 'ANIL';

--9. Update the amount of MINU to 10000. (Use Deposit Table)
     update Deposit
     set AMOUNT = 10000
     where CNAME = 'MINU';

--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)
     update Deposit
     set AMOUNT = 5000,
         ADATE = '1996-04-01'
     where CNAME = 'PRAMOD';



     --Part – B:----------------------------------------------------------
     --    1. Give 10% Increment in Loan Amount. (Use Borrow Table)
         select * from Borrow;
         update Borrow 
         set AMOUNT = AMOUNT + AMOUNT*0.1;
      

     --    2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table)
         select * from Deposit;
         update Deposit 
         set AMOUNT = AMOUNT + AMOUNT*0.2;

     --    3. Increase Amount by 1000 in all the account. (Use Deposit Table)
         update Deposit 
         set AMOUNT = AMOUNT + 1000;

     --    4. Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the
     --    customer name is ‘MEHUL’ and the loan number is even.
         update BORROW 
         set AMOUNT = 7000,
             BNAME = 'CENTRAL'
             WHERE CNAME = 'MEHUL' AND LOANNO % 2 = 0;

             SELECT * FROM BORROW;

     --    5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in
     --   ‘VRCE’ and with an account number less than 105.
             SELECT * FROM DEPOSIT;
             UPDATE DEPOSIT
             SET ADATE = '2022-05-15',
                 AMOUNT = 2500
                 WHERE BNAME = 'VRCE' AND ACTNO < 105;

            --     Part – C:------------------------------------------------------------------------------------------
            --1. Update amount of loan no 321 to NULL. (Use Borrow Table)
            SELECT * FROM BORROW;
               UPDATE BORROW
               SET AMOUNT = NULL
               WHERE LOANNO = 321;

            --2. Update branch name of KRANTI to NULL (Use Borrow Table)
                UPDATE BORROW
               SET BNAME = NULL
               WHERE CNAME = 'KRANTI';

            --3. Display the name of borrowers whose Loan number is NULL. (Use Borrow Table)
               SELECT CNAME FROM BORROW
               WHERE LOANNO IS NULL;

            --4. Display the Borrowers whose having branch. (Use Borrow Table)
                SELECT CNAME FROM BORROW
                WHERE NOT BNAME IS NULL;

            --5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481.
            --(Use Borrow Table)
                UPDATE BORROW
                SET AMOUNT = 5000,
                    BNAME = 'VRCE',
                    CNAME = 'DARSHAN'
                    WHERE LOANNO = 481;

            --6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less
            --than 2000.
                UPDATE DEPOSIT 
                SET ADATE = '2021-01-01'
                WHERE AMOUNT < 2000;

                SELECT * FROM DEPOSIT;

            --7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is
            --110.
                UPDATE DEPOSIT
                SET ADATE = NULL,
                    BNAME = 'ANDHERI'
                    WHERE ACTNO = 110;
                     