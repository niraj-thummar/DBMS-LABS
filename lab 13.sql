--From the above given table perform the following queries:
--Part – A:
--1. List all books with their authors.
   select 
   authorName,title
   from author inner join book
   on author.authorId = book.authorId
   

--2. List all books with their publishers.
   select 
   PublisherName,title
   from Publisher inner join book
   on Publisher.publisherId = book.publisherId
   

--3. List all books with their authors and publishers.
   select 
   authorName,PublisherName,title
   from Publisher inner join book 
   on Publisher.publisherId = book.publisherId 
   inner join author
   on book.authorId = author.authorId
   

--4. List all books published after 2010 with their authors and publisher and price.
   select 
   authorName,PublisherName,title, price
   from Publisher inner join book 
   on Publisher.publisherId = book.publisherId 
   inner join author
   on book.authorId = author.authorId 
   where PublicationYear > 2010;

--5. List all authors and the number of books they have written.
   select
   authorName, count(title) as written 
   from author inner join book
   on author.authorId = book.authorId
   group by authorName;


--6. List all publishers and the total price of books they have published.
   select
   PublisherName, sum(price) as price 
   from publisher inner join book
   on publisher.publisherId = book.publisherId
   group by PublisherName;


--7. List authors who have not written any books.
   select
   authorName 
   from author left join book
   on author.authorId = book.authorId
   where title is null;

--8. Display total number of Books and Average Price of every Author.
   select
   authorName,
   count(title) as totalBooks,
   avg(price) as average
   from author inner join book
   on author.authorId = book.authorId
   group by authorName;


--9. lists each publisher along with the total number of books they have published, sorted from highest to
--lowest.
select 
authorName,
count(title) as totalBokks
from author inner join book
on author.authorId = book.authorId
group by authorName
order by count(title) desc;


--10. Display number of books published each year.
    select
    title, publicationYear, count(title) as total
    from book
    group by PublicationYear, title;


--Part – B:
--1. List the publishers whose total book prices exceed 500, ordered by the total price.
    select
    PublisherName,
    sum(price) as total_price
    from publisher inner join book
    on publisher.PublisherID = book.publisherId
    group by publisherName
    having sum(price) > 500
    order by total_price desc

--2. List most expensive book for each author, sort it with the highest price.
    select 
    authorName,
    max(price) as highest
    from author inner join book
    on author.authorId = book.authorId
    group by authorName
    order by highest desc


--Part – C: Create table as per following schema with proper validation and try to insert data which violate your
--validation.
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did))
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)
  

--2. Insert 5 records in each table.
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all
--employees.