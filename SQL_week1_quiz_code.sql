--For all of the questions in this quiz, we are using the Chinook database. All of the interactive code blocks have been setup to retrieve data only from this database.

--Q1) Retrieve all the records from the Employees table.

SELECT *
FROM Employees;


--Q2) Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

Select FirstName
       ,LastName
       ,BirthDate
       ,Address
       ,City
       ,State
From Employees
WHERE BirthDate = '1965-03-03 00:00:00' ; 


--Q3) Retrieve all the columns from the Tracks table, but only return 20 rows.

Select Milliseconds
From Tracks
WHERE TrackId = 5;