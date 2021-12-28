--vidu1
SELECT LEFT('International',5)
Go

--vidu2
USE AdventureWorks2019
SELECT * FROM HumanResources.Employee
Go

--vidu3
USE AdventureWorks2019
SELECT LocationID, CostRate FROM Production.Location
Go
--vidu4
USE AdventureWorks2019
SELECT Name +':'+ CountryRegionCode +'->'+ Group FROM Sales,SalesTerritory
GO

--vidu5
USE AdventureWorks2019
SELECT Name +':'+ CountryRegionCode +'->'+ [Group] AS NameRegionGroup FROM Sales.SalesTerritory
GO

--vidu6
USE AdventureWorks2019
SELECT ModifiedDate as 'ChangedDate' FROM Person.Person
Go

--vidu7
USE AdventureWorks2019
SELECT ProductID, StandardCost, StandardCost*0.15 AS Discount FROM Production.ProductCostHistory
Go

--vidu8
USE AdventureWorks2019
SELECT DISTINCT StandardCost FROM Production.ProductCostHistory
GO

--vidu9
USE AdventureWorks2019
SELECT ProductModelID, Name INTO Production.ProductName FROM Production.ProductModel
Go

--vidu10
USE AdventureWorks2019
SELECT*FROM Production.ProductCostHistory WHERE EndDate='2013-05-29 00:00:00.000'
Go

--vidu11
USE AdventureWorks2019
SELECT*FROM HumanResources.Department WHERE DepartmentID<10
Go