
USE library;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES 
(1, 101, '123 Library St, City Center', '9876543210'),
(2, 102, '456 East St, Uptown', '9123456789');


-- Now insert Employee Records
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(204, 'Diana Prince', 'Manager', 52000.00, 1),
(205, 'John Doe', 'Analyst', 60000.00, 1),
(206, 'Bruce Wayne', 'Director', 80000.00, 2),
(207, 'Clark Kent', 'Clerk', 30000.00, 2),
(208, 'Selina Kyle', 'Librarian', 55000.00, 2);


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(304, 'Mary Jane', '77 Marvel Lane', '2023-12-15'),
(305, 'Peter Parker', '100 New York Ave', '2021-06-20'),
(306, 'Tony Stark', '108 Malibu Point', '2019-11-25');


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(307, 'Mary Jane', '77 Marvel Lane', '2023-12-15'),
(308, 'Peter Parker', '100 New York Ave', '2021-06-20'), -- Use a new ID for Peter Parker
(309, 'Tony Stark', '108 Malibu Point', '2019-11-25'); -- Same here


-- Now insert IssueStatus Records
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES 
(403, 301, 'Harry Potter and the Sorcerer\'s Stone', '2023-06-12', '9780590353427'),
(404, 305, 'The Great Gatsby', '2021-07-01', '9780743273565');

SELECT DATABASE();

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(310, 'Mary Jane', '77 Marvel Lane', '2023-12-15'), 
(311, 'Peter Parker', '100 New York Ave', '2021-06-20'), 
(312, 'Tony Stark', '108 Malibu Point', '2019-11-25');

USE library;
SELECT * FROM Customer;

SELECT * FROM Employee;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(210, 'Diana Prince', 'Manager', 52000.00, 1),
(211, 'John Doe', 'Analyst', 60000.00, 1),
(212, 'Bruce Wayne', 'Director', 80000.00, 2),
(213, 'Clark Kent', 'Clerk', 30000.00, 2),
(214, 'Selina Kyle', 'Librarian', 55000.00, 2);

SELECT * FROM Branch;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES 
('9780590353427', 'Harry Potter and the Sorcerer\'s Stone', 'Fiction', 200, 'yes', 'J.K. Rowling', 'Scholastic'),
('9780743273565', 'The Great Gatsby', 'Classic', 150, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9780141439600', 'Pride and Prejudice', 'Romance', 180, 'no', 'Jane Austen', 'Penguin Classics'),
('9780061120084', 'To Kill a Mockingbird', 'Drama', 250, 'yes', 'Harper Lee', 'Harper Perennial'),
('9780316769488', 'The Catcher in the Rye', 'Fiction', 170, 'no', 'J.D. Salinger', 'Little, Brown and Company');



/*Retrieve the book title, category, and rental price of all available
books.*/
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

/*  List the employee names and their respective salaries in descending
order of salary.*/

SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;



SELECT * FROM Customer;


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES (301, 'Mary Jane', '77 Marvel Lane', '2023-12-15');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES 
(403, 301, 'Harry Potter and the Sorcerer\'s Stone', '2023-06-12', '9780590353427'),
(404, 305, 'The Great Gatsby', '2021-07-01', '9780743273565');


/* Retrieve the book titles and the corresponding customers who have
issued those books.*/

SELECT I.Issued_book_name AS Book_Title, C.Customer_name AS Customer_Name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

/* Display the total count of books in each category.*/

SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

/* Retrieve the employee names and their positions for the employees
whose salaries are above Rs.50,000.*/

SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

/*List the customer names who registered before 2022-01-01 and have
not issued any books yet.*/

SELECT C.Customer_name 
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issued_cust IS NULL;

/* Display the branch numbers and the total count of employees in each
branch.*/

SELECT E.Branch_no, COUNT(E.Emp_Id) AS Total_Employees 
FROM Employee E
GROUP BY E.Branch_no;

/* Display the names of customers who have issued books in the month
of June 2023*/


SELECT C.Customer_name 
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE I.Issue_date >= '2023-06-01' AND I.Issue_date < '2023-07-01';

/*  Retrieve book_title from book table containing history. 10.Retrieve
the branch numbers along with the count of employees for branches
having more than 5 employees.*/

SELECT * FROM Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9780590353427', 'Harry Potter and the Sorcerer\'s Stone', 'Fiction', 5.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9780743273565', 'The Great Gatsby', 'Classic', 3.50, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons'),
('9780140449242', 'Crime and Punishment', 'Fiction', 4.00, 'yes', 'Fyodor Dostoevsky', 'Penguin Classics'),
('9780451524935', '1984', 'Dystopian', 4.50, 'yes', 'George Orwell', 'Signet Classics'),
('9780061120084', 'To Kill a Mockingbird', 'Fiction', 3.00, 'no', 'Harper Lee', 'Harper Perennial Modern Classics'),
('9780131101630', 'History: A Very Short Introduction', 'Non-Fiction', 2.50, 'yes', 'John Arnold', 'Oxford University Press'),
('9780134693320', 'History of the World', 'Non-Fiction', 6.00, 'yes', 'J.M. Roberts', 'Grove Press');


DELETE FROM Books WHERE ISBN = '9780590353427'; -- Use the appropriate ISBN you want to delete
SELECT * FROM IssueStatus WHERE Isbn_book = '9780590353427';
DELETE FROM IssueStatus WHERE Isbn_book = '9780590353427';

DELETE FROM Books WHERE ISBN = '9780590353427';

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9780590353428', 'Harry Potter and the Chamber of Secrets', 'Fiction', 5.00, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('9780743273566', 'The Great Gatsby: Special Edition', 'Classic', 3.50, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons'),
('9780140449243', 'Crime and Punishment: Annotated Edition', 'Fiction', 4.00, 'yes', 'Fyodor Dostoevsky', 'Penguin Classics'),
('9780451524936', '1984: Special Edition', 'Dystopian', 4.50, 'yes', 'George Orwell', 'Signet Classics'),
('9780061120085', 'To Kill a Mockingbird: Anniversary Edition', 'Fiction', 3.00, 'no', 'Harper Lee', 'Harper Perennial Modern Classics'),
('9780131101631', 'History: A Very Short Introduction (2nd Edition)', 'Non-Fiction', 2.50, 'yes', 'John Arnold', 'Oxford University Press'),
('9780134693321', 'History of the World: Updated', 'Non-Fiction', 6.00, 'yes', 'J.M. Roberts', 'Grove Press');

DELETE FROM IssueStatus WHERE Isbn_book = '9780590353427';
DELETE FROM Books WHERE ISBN = '9780590353427';

SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';


/*  Retrieve the branch numbers along with the count of employees
for branches having more than 5 employees*/
SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(Emp_Id) > 5;



