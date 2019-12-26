--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram
--to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

--Q1) Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT COUNT(TrackID),
Milliseconds
FROM Tracks
WHERE Milliseconds > 5000000;

--Q2) Run Query: Find all the invoices whose total is between $5 and $15 dollars.

SELECT Total
FROM Invoices
WHERE Total BETWEEN 5 AND 15;

--Q3) Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT State,
FirstName,
LastName,
Company
FROM Customers
WHERE State in ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY') and 
(Customers.FirstName = 'Jack' and Customers.LastName = 'Smith');


--Q4) Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT InvoiceId,
CustomerId,
Total,
InvoiceDate
FROM Invoices
WHERE CustomerId in (56, 58) and
(Total BETWEEN 1 and 5) and InvoiceId = 315;


--Q5) Run Query: Find all the tracks whose name starts with 'All'.

SELECT Name
FROM Tracks
WHERE Name LIKE 'All%';


--Q6) Run Query: Find all the customer emails that start with "J" and are from gmail.com.

SELECT *
FROM Customers
WHERE Email LIKE 'j%@gmail.com';


--Q7) Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT *
FROM Invoices
WHERE BillingCity in ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC;


--Q8) Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and 
--sort the result by the number of orders in descending order.

SELECT COUNT(CustomerId) as Counts
FROM Invoices
GROUP BY CustomerId
ORDER BY Counts DESC;


--Q9) Run Query: Find the albums with 12 or more tracks.

SELECT COUNT(AlbumId) as Counts
FROM Tracks
GROUP BY AlbumId
HAVING Counts >= 12;
