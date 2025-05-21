CREATE DATABASE Book_Managment;

USE Book_Managment;

create table Books(
    BookID int,
	Title varchar(100),
	Author Varchar(100),
	Genre varchar(50),
	Available BIT
);

create table Members(
    MembersID int,
	Names Varchar(50),
	Email Varchar(100),
);

create table Borrow(
    BorrowID int,
	BookID int, 
	MembersID int,
	BorrowDate Date,
	ReturnDate Date
);


insert into Books values
(1,'Python Basics', 'John Smith', 'Programming', 1),
(2, 'Data Analysis with SQL', 'Jane Doe', 'Data Science', 1),
(3, 'Modern Web Design', 'Steve Jobs', 'Design', 1),
(4, 'Learning Power BI', 'Alex Martin', 'Business Intelligence', 1),
(5, 'Advanced Excel Tricks', 'Emily Clark', 'Productivity', 1),
(6, 'Fundamentals of Database Systems', 'Elmasri & Navathe', 'Database', 1),
(7, 'Machine Learning 101', 'Andrew Ng', 'Machine Learning', 1),
(8, 'Data Science for Beginners', 'David Williams', 'Data Science', 1),
(9, 'SQL Server Essentials', 'Robert Taylor', 'Database', 1),
(10, 'Visualization with Matplotlib', 'Sarah Lee', 'Data Visualization', 1);


insert into Members values 
(1, 'Aishwarya jadhav', 'aishujadhav@example.com'),
(2, 'Rahul Verma', 'rahulverma@example.com'),
(3, 'Sneha Reddy', 'sneha.reddy@example.com'),
(4, 'Amit Deshmukh', 'amit.deshmukh@example.com'),
(5, 'Priya Sharma', 'priya.sharma@example.com'),
(6, 'Karan Patel', 'karan.patel@example.com'),
(7, 'Meena Joshi', 'meena.joshi@example.com'),
(8, 'Vikas Mehta', 'vikas.mehta@example.com'),
(9, 'Pooja Rao', 'pooja.rao@example.com'),
(10, 'Arjun Nair', 'arjun.nair@example.com'),
(11, 'Neha Kulkarni', 'neha.kulkarni@example.com'),
(12, 'Sameer Khan', 'sameer.khan@example.com');

insert into Borrow values
(1, 1, 1, '2025-05-18', NUll),
(2, 2, 2, '2025-05-17', '2025-05-19'),
(3, 3, 3, '2025-05-15', NULL),
(4, 4, 4, '2025-05-14', '2025-05-18'),
(5, 5, 5, '2025-05-13', '2025-05-16'),
(6, 6, 6, '2025-05-12', NULL),
(7, 7, 7, '2025-05-10', '2025-05-15'),
(8, 8, 8, '2025-05-09', NULL),
(9, 9, 9, '2025-05-08', '2025-05-10'),
(10, 10, 10, '2025-05-07', NULL);

select * from Books
 
select * from Members

select br.BorrowID, b.Title, m.Names, br.BorrowDate, br.ReturnDate 
from Borrow br 
join Books b on br.BookID = b.BookID
join Members m on br.MembersID = m.MembersID;


select Genre, count(*) AS TotalBooks
from Books 
Group by Genre

select distinct m.MembersID, m.Names, m.Email 
from Members m 
join Borrow b on m.MembersID = b.MembersID;


select 
       b.BorrowID,
       bk.Title AS BookTitle,
	   m.Names AS BorrowedBY,
	   b.BorrowDate
from Borrow b
join Books bk on bk.BookID = b.BookID
join Members m on m.MembersID = b.MembersID
where b.ReturnDate is null;


select 
      b.BookID,
	  b.Title,
	  br.BorrowID,
	  br.BorrowDate,
	  br.ReturnDate
from Books b
join Borrow br on b.BookID = br.BookID
ORDER BY BorrowDate DESC;


    