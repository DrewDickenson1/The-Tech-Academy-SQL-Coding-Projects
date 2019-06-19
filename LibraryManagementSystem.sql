CREATE DATABASE libraryManagementSystem

USE libraryManagementSystem

CREATE TABLE tbl_Library_Branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR(50) NOT NULL,
		branch_address VARCHAR(70) NOT NULL
	);
SELECT * FROM tbl_Library_Branch

CREATE TABLE tbl_Publisher (
		publisher_name VARCHAR(70) PRIMARY KEY NOT NULL,
		publisher_address VARCHAR(70) NOT NULL,
		publisher_phone VARCHAR(30) NOT NULL
	);
SELECT * FROM tbl_Publisher

CREATE TABLE tbl_Books (
		book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_title VARCHAR(70) NOT NULL,
		book_publisherName VARCHAR(70) NOT NULL
	);
SELECT * FROM tbl_Books
/*DROP TABLE tbl_Books*/
CREATE TABLE tbl_Book_Authors (
		book_authors_book_id INT NOT NULL IDENTITY (1,1) ,
		book_authors_author_name VARCHAR(70) NOT NULL
	);

CREATE TABLE tbl_Book_Copies (
		book_copies_book_id INT NOT NULL ,
		book_copies_branch_id INT NOT NULL,
		book_copies_number_of_copies INT NOT NULL
	);
CREATE TABLE tbl_Book_Loans (
		book_loans_book_id INT NOT NULL ,
		book_loans_branch_id INT NOT NULL,
		book_loans_card_no INT NOT NULL,
		book_loans_date_out VARCHAR(70) NOT NULL,
		book_loans_date_due VARCHAR(70) NOT NULL
	);

CREATE TABLE tbl_Borrower (
		borrower_card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(30) NOT NULL,
		borrower_phone VARCHAR(30) NOT NULL
	);
DROP TABLE tbl_Book_Loans 
DROP TABLE tbl_Borrower 


ALTER TABLE tbl_Books ADD CONSTRAINT FK_Publisher_Name FOREIGN KEY (book_publisherName) REFERENCES tbl_Publisher (publisher_name) ON DELETE CASCADE ON UPDATE CASCADE ;
ALTER TABLE tbl_Book_Authors ADD CONSTRAINT FK_Book_Id FOREIGN KEY (book_authors_book_id) REFERENCES tbl_Books (book_id) ON DELETE CASCADE ON UPDATE CASCADE ;
ALTER TABLE tbl_Book_Copies ADD CONSTRAINT FK_Book_Id_Two FOREIGN KEY (book_copies_book_id) REFERENCES tbl_Books (book_id) ON DELETE CASCADE ON UPDATE CASCADE ;
ALTER TABLE tbl_Book_Copies ADD CONSTRAINT FK_Branch_Id FOREIGN KEY (book_copies_branch_id) REFERENCES tbl_Library_Branch (branch_id) ON DELETE CASCADE ON UPDATE CASCADE ;
ALTER TABLE tbl_Book_Loans ADD CONSTRAINT FK_Book_Id_Three FOREIGN KEY (book_loans_book_id) REFERENCES tbl_Books (book_id) ON DELETE CASCADE ON UPDATE CASCADE ;
ALTER TABLE tbl_Book_Loans ADD CONSTRAINT FK_Branch_Id_Two FOREIGN KEY (book_loans_branch_id) REFERENCES tbl_Library_Branch (branch_id) ON DELETE CASCADE ON UPDATE CASCADE ;
ALTER TABLE tbl_Book_Loans ADD CONSTRAINT FK_Card_No FOREIGN KEY (book_loans_card_no) REFERENCES tbl_Borrower (borrower_card_no) ON DELETE CASCADE ON UPDATE CASCADE ;

INSERT INTO tbl_Library_Branch
		(branch_name,branch_address )
		VALUES 
		('Sharptown', 'Nashville'),
		('Central', 'Ashville'),
		('South', 'Orlando'),
		('West', 'Denver')
;
	SELECT * FROM tbl_Library_Branch;

INSERT INTO tbl_Publisher
		(publisher_name,publisher_address,publisher_phone )
		VALUES 
		('Billy Bob Publishing', 'Knoxville','865-456-8586 '),
		('Penguin Publishing', 'Reno', '578-986-9636 '),
		('Buget Publishing', 'Austin', '631-235-5458 ')	
;
	SELECT * FROM tbl_Publisher;

INSERT INTO tbl_Books
		(book_publisherName, book_title)
		VALUES 
		('Billy Bob Publishing', 'The Lost Tribe'),
		('Penguin Publishing', 'Good to Great'),
		('Buget Publishing', 'Bulit to Last'),
		('Buget Publishing', 'Harry Potter 1'),
		('Billy Bob Publishing', '50 Shades of Grey'),
		('Penguin Publishing', 'Lord of the Rings 1'),
		('Buget Publishing', 'Lord of the Rings 2'),
		('Buget Publishing', 'Lord of the Rings 3'),
		('Billy Bob Publishing', 'Harry Potter 2'),
		('Penguin Publishing', 'Harry Potter 3'),
		('Buget Publishing', 'The Silent Patient'),
		('Buget Publishing', 'Daisy Jones & The Six'),
		('Billy Bob Publishing', 'The Wicked King'),
		('Penguin Publishing', 'An Anonymous Girl'),
		('Buget Publishing', 'On the Come Up'),
		('Buget Publishing', 'The Huntress'),
		('Billy Bob Publishing', 'King of Scars'),
		('Penguin Publishing', 'The Lost Girls of Paris'),
		('Buget Publishing', 'The Priory of the Orange Tree'),
		('Buget Publishing', 'Black Leopard, Red Wolf')
;
SELECT * FROM tbl_Books;

INSERT INTO tbl_Book_Authors
		(book_authors_author_name)
		VALUES 
		('Stephen King'),
		('Jim Collins'),
		('Jim Collins'),
		('J.K. Rowling'),
		('E.L. James'),
		('J.R.R. Tolkien'),
		('J.R.R. Tolkien'),
		('J.R.R. Tolkien'),
		('J.K. Rowling'),
		('J.K. Rowling'),
		('Alex Michaelides'),
		('Taylor Jenkins Reid'),
		('Holly Black' ),
		('Greer Hendricks'),
		('Angie Thomas'),
		('Kate Quinn'),
		('Leigh Bardugo'),
		('Pam Jenoff '),
		('Samantha Shannon'),
		('Stephen King')
;
SELECT * FROM tbl_Book_Authors;

INSERT INTO tbl_Book_Copies
		(book_copies_book_id,book_copies_branch_id,book_copies_number_of_copies)
		VALUES 
		(1,1,2),
		(2,1,3),
		(3,1,5),
		(4,1,2),
		(5,1,2),
		(6,1,3),
		(7,1,2),
		(8,1,7),
		(9,1,6),
		(10,1,2),
		(1,2,2),
		(2,2,2),
		(3,2,4),
		(14,2,3),
		(15,2,2),
		(16,2,2),
		(17,2,4),
		(18,2,7),
		(19,2,2),
		(20,2,2),
		(11,3,2),
		(12,3,3),
		(13,3,5),
		(14,3,2),
		(15,3,2),
		(6,3,3),
		(7,3,2),
		(8,3,7),
		(9,3,6),
		(10,3,2),
		(1,4,2),
		(2,4,2),
		(3,4,4),
		(14,4,3),
		(15,4,2),
		(16,4,2),
		(17,4,4),
		(18,4,7),
		(19,4,2),
		(5,4,2)
;
SELECT * FROM tbl_Book_Copies

INSERT INTO tbl_Borrower
		(borrower_name,borrower_address,borrower_phone)
		VALUES 
		('Bill','Seattle','423-229-8798'),
		('George','Fairview','578-119-3298'),
		('Ashley','Mobile','293-369-8858'),
		('Lindsay','New York','866-921-6523'),
		('Mark','Las Angles','783-412-9687'),
		('Steve','San Diego','313-622-6742'),
		('Vanessa','Johnson City','589-879-6523'),
		('Sarah','Kingsport','589-874-6352'),
		('Jim','Bristol','459-876-3521')
;
SELECT * FROM tbl_Borrower


INSERT INTO tbl_Book_Loans
		(book_loans_book_id,book_loans_branch_id,book_loans_card_no,book_loans_date_out,book_loans_date_due)
		VALUES 
		(1,1,1,'1/15/19','3/15/19'),
		(2,1,2,'1/23/19','3/23/19'),
		(3,1,3,'2/2/19','4/2/19'),
		(4,1,4,'3/14/19','5/14/19'),
		(5,1,5,'3/27/19','5/27/19'),
		(6,1,6,'1/15/19','3/15/19'),
		(7,1,7,'2/15/19','4/15/19'),
		(8,1,8,'3/15/19','5/15/19'),
		(9,1,1,'4/15/19','6/15/19'),
		(10,1,2,'5/15/19','7/15/19'),
		(1,2,1,'6/15/19','8/15/19'),
		(2,2,2,'7/15/19','9/15/19'),
		(3,2,3,'8/15/19','10/15/19'),
		(14,2,4,'9/15/19','11/15/19'),
		(15,2,5,'10/15/19','12/15/19'),
		(16,2,6,'11/15/19','1/15/20'),
		(17,2,7,'12/15/19','2/15/20'),
		(18,2,8,'1/15/19','3/15/19'),
		(19,2,1,'2/15/19','4/15/19'),
		(20,2,2,'3/15/19','5/15/19'),
		(11,3,1,'4/15/19','6/15/19'),
		(12,3,2,'5/15/19','7/15/19'),
		(13,3,3,'6/15/19','8/15/19'),
		(14,3,4,'7/15/19','9/15/19'),
		(15,3,5,'8/15/19','10/15/19'),
		(6,3,6,'9/15/19','11/15/19'),
		(7,3,7,'10/15/19','12/15/19'),
		(8,3,8,'11/15/19','1/15/20'),
		(9,3,1,'12/15/19','2/15/20'),
		(10,3,2,'1/15/19','3/15/19'),
		(1,4,1,'2/15/19','4/15/19'),
		(2,4,2,'3/15/19','5/15/19'),
		(3,4,3,'4/15/19','6/15/19'),
		(14,4,4,'5/15/19','7/15/19'),
		(15,4,5,'6/15/19','8/15/19'),
		(16,4,6,'7/15/19','9/15/19'),
		(17,4,7,'8/15/19','10/15/19'),
		(18,4,8,'9/15/19','11/15/19'),
		(19,4,1,'10/15/19','12/15/19'),
		(5,4,2,'11/15/19','1/15/20'),
		(11,4,1,'12/15/19','2/15/20'),
		(12,4,2,'1/15/19','3/15/19'),
		(13,4,3,'2/15/19','4/15/19'),
		(4,4,4,'3/15/19','5/15/19'),
		(5,4,5,'4/15/19','6/15/19'),
		(6,4,6,'5/15/19','7/15/19'),
		(7,4,7,'6/15/19','8/15/19'),
		(8,4,8,'7/15/19','9/15/19'),
		(9,4,1,'8/15/19','10/15/19'),
		(15,4,2,'9/15/19','11/15/19')
;

SELECT * FROM tbl_Book_Loans

--QUERY 1
--How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROCEDURE dbo.booksByBranch @book_title nvarchar(30) = NULL, @branch_name nvarchar(60) = NULL
AS
SELECT
		a1.book_copies_number_of_copies as 'Number of Copies', a2.branch_name as 'Branch Name', a3.book_title as 'Book Title'
		FROM tbl_Book_Copies a1
		INNER JOIN tbl_Library_Branch a2 ON a2.branch_id = a1.book_copies_branch_id
		INNER JOIN tbl_Books a3 ON a3.book_id = a1.book_copies_book_id
		
WHERE book_title = ISNULL(@book_title,book_title)
AND branch_name LIKE '%' + ISNULL(@branch_name,branch_name) + '%'
GO
--DROP PROCEDURE dbo.booksByBranch

EXEC dbo.booksByBranch @book_title = 'The Lost Tribe', @branch_name = 'Sharptown' ;

--QUERY 2
--How many copies of the book titled "The Lost Tribe" are owned by each library branch?
EXEC dbo.booksByBranch @book_title = 'The Lost Tribe', @branch_name = '' ;

--QUERY 3
--Retrieve the names of all borrowers who do not have any books checked out?
CREATE PROCEDURE dbo.borrowerNoLoan 
AS
SELECT
		a2.borrower_name as 'Borrower Name'
		FROM tbl_Book_Loans a1
		FULL OUTER JOIN tbl_Borrower a2 ON a2.borrower_card_no = a1.book_loans_card_no
		
WHERE book_loans_book_id IS NULL
GO
DROP PROCEDURE dbo.borrowerNoLoan
EXEC dbo.borrowerNoLoan /*@book_id = '16'*/

--QUERY 4
-- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
CREATE PROCEDURE dbo.booksDueByBranch @due_date nvarchar(30) = NULL, @branch_name nvarchar(60) = NULL
AS
SELECT
		a4.borrower_name as 'Borrowers Name',a4.borrower_address as 'Borrowers Address', a2.branch_name as 'Branch Name', a3.book_title as 'Book Title', a1.book_loans_date_due as 'Due Date'
		FROM tbl_Book_Loans a1
		INNER JOIN tbl_Library_Branch a2 ON a2.branch_id = a1.book_loans_branch_id
		INNER JOIN tbl_Books a3 ON a3.book_id = a1.book_loans_book_id
		INNER JOIN tbl_Borrower a4 ON a4.borrower_card_no = a1.book_loans_card_no
WHERE book_loans_date_due = ISNULL(@due_date,book_loans_date_due)
AND branch_name LIKE '%' + ISNULL(@branch_name,branch_name) + '%'
GO
--DROP PROCEDURE dbo.booksByBranch

EXEC dbo.booksDueByBranch @due_date = '4/15/19', @branch_name = 'Sharptown' ;
--Would like to know how to code this to automatically pull in today's date and format correctly

--QUERY 5 NEED HELP can't join to show the name of the branch name in the table
-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
CREATE PROCEDURE dbo.booksLoanedByBranch 
AS
SELECT COUNT (*) AS 'Total Loaned Out' ,
		a2.branch_name as 'Branch Name' 
		FROM tbl_Book_Loans a1
		INNER JOIN tbl_Library_Branch a2 ON a2.branch_id = a1.book_loans_branch_id
	
GROUP BY branch_name
GO
DROP PROCEDURE dbo.booksLoanedByBranch

EXEC dbo.booksLoanedByBranch 
GO
--QUERY 6
--Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
CREATE PROCEDURE dbo.booksByLargeBorrower 
AS
SELECT
		a4.borrower_name as 'Borrowers Name',a4.borrower_address as 'Borrowers Address', COUNT(book_loans_card_no) AS 'Total Books Checked Out'
		FROM tbl_Book_Loans a1
		INNER JOIN tbl_Library_Branch a2 ON a2.branch_id = a1.book_loans_branch_id
		INNER JOIN tbl_Books a3 ON a3.book_id = a1.book_loans_book_id
		INNER JOIN tbl_Borrower a4 ON a4.borrower_card_no = a1.book_loans_card_no
GROUP BY borrower_name, borrower_address
HAVING COUNT (book_loans_card_no) > 5 
GO
--DROP PROCEDURE dbo.booksByBranch

EXEC dbo.booksByLargeBorrower

--QUERY 7
--For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
CREATE PROCEDURE dbo.bookAuthorsByBranch @book_author nvarchar(30) = NULL, @branch_name nvarchar(60) = NULL
AS
SELECT
		a1.book_copies_number_of_copies as 'Number of Copies', a2.branch_name as 'Branch Name', a3.book_title as 'Book Title', a4.book_authors_author_name as 'Author Name'
		FROM tbl_Book_Copies a1
		INNER JOIN tbl_Library_Branch a2 ON a2.branch_id = a1.book_copies_branch_id
		INNER JOIN tbl_Books a3 ON a3.book_id = a1.book_copies_book_id
		INNER JOIN tbl_Book_Authors a4 ON a4.book_authors_book_id = a1.book_copies_book_id
WHERE book_authors_author_name = ISNULL(@book_author,book_authors_author_name)
AND branch_name LIKE '%' + ISNULL(@branch_name,branch_name) + '%'
GO
--DROP PROCEDURE dbo.bookAuthorsByBranch

EXEC dbo.bookAuthorsByBranch  @book_author = 'Stephen King', @branch_name = 'Central' ;



















SELECT SUM(salary) AS "Total Salary"
FROM employees
WHERE salary > 25000;

SELECT COUNT( * ) as "Number of Rows"
FROM orders
WHERE ord_amount>1500;

SELECT COUNT (*) AS 'Total Loaned Out' 
		FROM tbl_Book_Loans a1
WHERE  book_loans_branch_id = 4

GO