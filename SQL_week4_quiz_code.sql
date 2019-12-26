--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram
--in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.


--Q1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together.
--Be sure to make a space in between these two and make it UPPER CASE.

SELECT CustomerId,
FirstName,
LastName,
Address,
City,
Country,
CustomerId ||  ' '||FirstName||'' || ' '||LastName||''
|| ' '||Address||'' || ' '||UPPER(City)||'' || ' '||UPPER(Country)||''
AS concatenated
FROM Customers;


--Q2) Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters
--of the employee’s last name. Make the new field lower case and pull each individual step to show your work.

SELECT EmployeeId,
FirstName,
LastName,
LOWER(substr(FirstName, 1, 4)) || ''||LOWER(substr(LastName, 1, 2))||''
AS emp_userid
FROM Employees;


--Q3) Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

SELECT EmployeeId,
FirstName,
LastName,
HireDate, strftime('%Y',HireDate) AS 'Start_year',
strftime('%Y', 'now') AS 'Current_date'
FROM Employees
WHERE (strftime('%Y', 'now') - strftime('%Y',HireDate)) >= 15
ORDER BY LastName ASC;


--Q4) Profiling the Customers table, answer the following question.
--Are there any columns with null values? Indicate any below. Select all that apply.

SELECT *
FROM Customers
WHERE Address is NULL;


--Q5) Find the cities with the most customers and rank in descending order.
--Which of the following cities indicate having 2 customers?

Select COUNT(*) AS COUNTS,
City
FROM Customers
GROUP BY City
HAVING COUNTS = 2;


--Q6) Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query
--in the following order: firstname, lastname, and invoiceID.

SELECT Customers.FirstName,
Customers.LastName,
Invoices.InvoiceId,
Customers.FirstName || ''||Customers.LastName||'' || ''||Invoices.InvoiceId||''
AS new_id
FROM Customers
INNER JOIN Invoices ON  Customers.CustomerId = Invoices.CustomerId
WHERE Invoices.InvoiceId IN (SELECT Invoices.InvoiceId
  FROM Customers
  INNER JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId)
ORDER BY FirstName, LastName, InvoiceId;
