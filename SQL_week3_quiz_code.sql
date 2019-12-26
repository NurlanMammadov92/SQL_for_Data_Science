--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram
--in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.


--Q1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Albums.Title, Tracks.Name
FROM Albums
INNER JOIN Tracks ON Albums.AlbumId = Tracks.AlbumId
WHERE Albums.Title = 'Californication'
LIMIT 8;


--Q2) Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT COUNT(InvoiceId),
Customers.FirstName,
Customers.LastName,
Customers.City,
Customers.Email,
Invoices.InvoiceId
FROM Customers
INNER JOIN Invoices on Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId;


--Q3) Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT Tracks.TrackID, Tracks.Name, Albums.Title, Albums.ArtistId
FROM Tracks
INNER JOIN Albums ON Tracks.AlbumId = Albums.AlbumId;


--Q4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT A.EmployeeId AS 'EmpId', A.LastName AS 'EmpName',
B.EmployeeId AS 'SupId', B.LastName AS 'SupName'
FROM Employees A, Employees B
WHERE A.ReportsTo = B.EmployeeId;


--Q5) Find the name and ID of the artists who do not have albums.

SELECT Artists.ArtistId, Artists.Name
FROM Artists
LEFT JOIN Albums ON Artists.ArtistId = Albums.ArtistId
WHERE Albums.ArtistId is NULL;


--Q6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName 
FROM Customers
ORDER BY LastName DESC
LIMIT 6;


--Q7) See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT Customers.City, Invoices.BillingCity
FROM Customers
INNER JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId
WHERE Customers.City <> Invoices.BillingCity;
