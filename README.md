# MySQL-Project

Library Management System
This Library Management System project is a relational database designed to manage the operations of a library effectively. It keeps track of all information about library branches, employees, customers, books, their availability status, and the issue and return records. The goal of this system is to streamline library operations by efficiently organizing data, ensuring data consistency, and facilitating queries.

Project Features
Manage multiple branches, employees, and their assignments.
Track books, including their categories, rental prices, and availability.
Record customers and their interactions with the library (issue and return of books).
Monitor the status of book issues and returns with precise dates.
Perform efficient queries to retrieve essential information for library management.
🛠️ Database Structure
1. Branch Table
Stores information about library branches.

Attribute	Type	Description
Branch_no	INT	Primary key for each branch.
Manager_Id	INT	ID of the manager assigned to the branch.
Branch_address	VARCHAR	Address of the branch.
Contact_no	VARCHAR	Contact number of the branch.


Employee Table
Stores details of employees working at different branches.

Attribute	Type	Description
Emp_Id	INT	Primary key for each employee.
Emp_name	VARCHAR	Name of the employee.
Position	VARCHAR	Role/position in the library.
Salary	DECIMAL	Salary of the employee.
Branch_no	INT	Foreign key referencing the Branch table.


Customer Table
Tracks customers who register with the library.

Attribute	Type	Description
Customer_Id	INT	Primary key for each customer.
Customer_name	VARCHAR	Name of the customer.
Customer_address	VARCHAR	Address of the customer.
Reg_date	DATE	Date of registration.



Books Table
Stores information about the books available in the library.

Attribute	Type	Description
ISBN	VARCHAR	Primary key for each book (ISBN).
Book_title	VARCHAR	Title of the book.
Category	VARCHAR	Category or genre of the book.
Rental_Price	DECIMAL	Rental price of the book.
Status	VARCHAR	Indicates if the book is available ('yes'/'no').
Author	VARCHAR	Author of the book.
Publisher	VARCHAR	Publisher of the book.



IssueStatus Table
Tracks the books issued to customers.

Attribute	Type	Description
Issue_Id	INT	Primary key for each issued record.
Issued_cust	INT	Foreign key referencing Customer_Id.
Issued_book_name	VARCHAR	Title of the issued book.
Issue_date	DATE	Date when the book was issued.
Isbn_book	VARCHAR	Foreign key referencing the ISBN.



ReturnStatus Table
Tracks the status of returned books.

Attribute	Type	Description
Return_Id	INT	Primary key for each return record.
Return_cust	INT	Foreign key referencing Customer_Id.
Return_book_name	VARCHAR	Title of the returned book.
Return_date	DATE	Date of return.
Isbn_book2	VARCHAR	Foreign key referencing the ISBN.
