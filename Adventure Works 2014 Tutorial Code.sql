
/*Example 1 of how to store a procedure*/
SELECT * FROM Person.Address

USE AdventureWorks2014


CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO

EXECUTE [dbo].[uspGetAddress]



/*Example 2A of how to pass through a parameter into the get address stored procedure*/
DROP PROCEDURE [dbo].[uspGetAddress]

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * 
FROM Person.Address
WHERE City = @City
GO

EXECUTE [dbo].[uspGetAddress] @City = 'New York' /* this finds all the results with the value for the column city = New York */

DROP PROCEDURE [dbo].[uspGetAddress]

/*Example 2B We can also do the same thing, but allow the users to give us a starting point to search the data.  Here we can change the "=" to a LIKE and use the "%" wildcard.*/
CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) 
AS 
SELECT * 
FROM Person.Address 
WHERE City LIKE @City + '%' 
GO
/*In both of the proceeding examples it assumes that a parameter value will always be passed. If you try to execute the procedure without passing a parameter value you will get an error message such as the following:*/

EXECUTE [dbo].[uspGetAddress] @City = 'New' /*this code allows you to pass the paramter new through which will pull any city with new in it such as New York, Newport Hills, Newton, Newcastle, etc. The example above only will match exact values whereas this code you just need to match part*/

/*Example 2C- This will pull all values that have a Null value if you don't pass a parameter through*/
DROP PROCEDURE [dbo].[uspGetAddress]

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = @City
GO

EXECUTE [dbo].[uspGetAddress]@City /*If you don't pass through a paramter here the it will pass through the Null value and since all data in this table has a city named no data is shown when you execute this code*/

/*2D Example - TWe could change this stored procedure and use the ISNULL function to get around this.  So if a value is passed it will use the value to narrow the result set and if a value is not passed it will return all records.*/
DROP PROCEDURE [dbo].[uspGetAddress]

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL (@City,City)
GO

EXECUTE [dbo].[uspGetAddress] 

/*2E Example This is how you pass through multiple paramaters. Note you don't have to pass through 2 paramaters you can do just one of either paramater*/
DROP PROCEDURE [dbo].[uspGetAddress]

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

EXEC dbo.uspGetAddress @City = 'Calgary', @AddressLine1 = 'Ave' 

/*Example 3 - this is how to call a procedure to get an OUTPUT paramter instead of inputting a paramater - This example counts the amount of rows with Calgary*/
DROP PROCEDURE dbo.uspGetAddressCount

CREATE PROCEDURE dbo.uspGetAddressCount @City nvarchar(30), @AddressCount int OUTPUT
AS
SELECT @AddressCount = count(*) 
FROM Person.Address 
WHERE City = @City

DECLARE @AddressCount int
EXECUTE dbo.uspGetAddressCount @City = 'Calgary', @AddressCount = @AddressCount OUTPUT
SELECT @AddressCount

/*the example below is the try and catch code which lets you try a stored procedure and if there is an error it lets you control the error message*/

CREATE PROCEDURE dbo.uspTryCatchTest
AS
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

--comment code = two hypens is a way to comment code in sql aswell


--do not use "sp_" as a prefix because this is a special prefix in SQL
-- USE others such as : usp_ , sp , usp

--Example 4 - how to reduce network data is to get SQL to not count the number of rows affected by using the code NOCOUNT
CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * 
FROM Person.Address
WHERE City = @City
GO
EXEC dbo.uspGetAddress @City = 'Calgary'
-- BELOW is the NOCOUNT ON CODE
DROP PROCEDURE dbo.uspGetAddress
CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SET NOCOUNT ON
SELECT * 
FROM Person.Address
WHERE City = @City
GO
EXEC dbo.uspGetAddress @City = 'Calgary'
-- this code should stop the network data but @@ROWCOUNT will still give you a row count if needed
DROP PROCEDURE dbo.uspGetAddress
CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SET NOCOUNT ON
SELECT * 
FROM Person.Address
WHERE City = @City
PRINT @@ROWCOUNT
GO

--This is how to drop multiple procedures
DROP PROCEDURE dbo.uspGetAddress, dbo.uspInsertAddress, dbo.uspDeleteAddress
GO

-- New Example of how to modify or change a stored procedure
--Let's say we have the following existing stored procedure:  This allows us to do an exact match on the City.
DROP PROCEDURE dbo.uspGetAddress

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * 
FROM Person.Address
WHERE City = @City
GO

--Let's say we want to change this to do a LIKE instead of an equals.To change the stored procedure and save the updated code you would use the ALTER PROCEDURE command as follows.

ALTER PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * 
FROM Person.Address
WHERE City LIKE @City + '%'
GO
--Now the next time that the stored procedure is called by an end user it will use this new logic


--Tech Academy Challenge - Has to have two joins and two paramaters

CREATE PROCEDURE dbo.uspGetPrice @unitPrice nvarchar(30) = NULL , @listPrice nvarchar(60) = NULL
AS
SELECT
 P.Name, 
 P.ListPrice, 
 P.Size, 
 P.ModifiedDate, 
 SOD.UnitPrice, 
 SOD.UnitPriceDiscount,
 SOD.OrderQty,
 SOD.LineTotal,
 PM.Name
FROM Sales.SalesOrderDetail SOD 
INNER JOIN Production.Product P ON SOD.ProductID = P.ProductID 
INNER JOIN Production.ProductModel PM ON PM.ProductModelID = P.ProductModelID
WHERE UnitPrice = ISNULL(@UnitPrice,UnitPrice)
 AND ListPrice LIKE '%' + ISNULL(@listPrice ,ListPrice) + '%' 
GO

EXECUTE dbo.uspGetPrice @unitPrice = 5.70 , @listPrice = '9.50' 

DROP PROCEDURE dbo.uspGetPrice
SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Sales.Currency
SELECT * FROM Sales.SalesPerson
SELECT * FROM Sales.SalesTerritory
SELECT * FROM Production.Product
SELECT * FROM Production.ProductModel

a1.species_name as 'Name:', a2.habitat_type as 'Habitat:', a2.habitat_cost as 'Monthly cost:',
		a3.nutrition_type as 'Nutrition:', a3.nutrition_cost 'Monthly cost:'
		FROM tbl_species a1
		INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
		WHERE species_name = 'ghost bat'