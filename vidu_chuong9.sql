--vidu1
SELECT WorkOrderID, SUM (ActualResourceHrs) AS TotalHoursPerWorkOrder 
FROM Production.WorkOrderRouting GROUP BY WorkOrderID
GO


--vidu2
SELECT WorkOrderID, SUM(ActualResourceHrs) AS TotalHoursPerWorkOrder
FROM Production.WorkOrderRouting WHERE WorkOrderID <50 GROUP BY WorkOrderID
GO


--vidu3
SELECT Class, AVG (ListPrice) AS 'AverageListPrice' FROM Production.Product GROUP BY Class
GO


--vidu4
SELECT [Group], SUM(SalesYTD) AS 'TotalSales' FROM Sales.SalesTerritory WHERE
[Group] LIKE 'n%' OR [Group] LIKE 'E%' GROUP BY ALL [Group]
GO


--vidu5
SELECT [Group], SUM(SalesYTD) AS 'TotalSales' FROM Sales.SalesTerritory WHERE
[Group] LIKE 'P%' GROUP BY ALL [Group] HAVING SUM(SalesYTD) <6000000
GO


--vidu6
SELECT Name, CountryRegionCode, SUM(SalesYTD) AS TotalSales FROM Sales.SalesTerritory WHERE Name 
<>'Australia' And Name<>'Canada' GROUP BY Name, CountryRegionCode WITH CUBE
GO


--vidu7
SELECT Name, CountryRegionCode, SUM(SalesYTD) AS TotalSales FROM 
Sales.SalesTerritory
WHERE Name <>'Australia' And Name<> 'Canada' GROUP BY
Name, CountryRegionCode
WITH ROLLUP
GO


--vidu8
SELECT AVG ((UnitPrice)) AS AvgUnitPrice, MIN ((OrderQty)) AS MinQty,
MAX ((UnitPricediscount)) AS MaxDiscount
FROM Sales.SalesOrderDetail;
GO


--vidu9
SELECT SalesOrderID, AVG(UnitPrice) AS AvgPrice FROM Sales.SalesOrderDetail;
GO


--vidu10
SELECT MIN (OrderDate) AS Earliest, MAX (OrderDate) AS Latest FROM
Sales.SalesOrderHeader
GO


--vidu11
SELECT geometry::Point (251, 1, 4326) .STUnion (geometry:: Point (252,2,4326));
GO


--vidu12
DECLARE @Cityl geography
SET @Cityl =geography::STPolyFromText (
'POLYGON( (175.3-41.5, 178.3-37.9,172.8-34.6,175.3-41.5))', 4326) DECLARE @City2 geography
SET @City2 = geography::STPolyFromText (
'POLYGON ((169.3-46.6, 174.3-41.6, 172.5-40.7, 166.3-45.8, 169.3-46.6) )', 4326)
DECLARE @CombinedCity geography = @Cityl.STUnion(@City2)
SELECT @CombinedCity
GO


--vidu13
SELECT Geography::UnionAggregate(SpatialLocation) AS AVGLocation FROM Person. Address
WHERE City = ' London ' ;
GO


--vidu14
SELECT Geography::UnionAggregate(SpatialLocation) AS Location FROM Person.Address
WHERE City = ' London ' 
GO


--vidu15
DECLARE @CollectionDemo TABLE ( shape geometry, shapeType nvarchar(50))
INSERT INTO @CollectionDemo(shape,shapeType) VALUES('CURVEPOLYGON(
CIRCULARSTRING(2 3, 41, 63, 45, 23))', 'Circle'),
('POLYGON ((1 1, 4 1, 4 5, 1 5, 1 1))', 'Rectangle');

SELECT geometry::CollectionAggregate (shape) FROM @CollectionDemo; 
GO


--vidu16
SELECT Geography ::ConvexHullAggregate (SpatialLocation) AS Location FROM Person.Address
WHERE City ='london'
GO


--vidu17
SELECT DueDate, ShipDate FROM Sales.SalesOrderHeader WHERE
Sales.SalesOrderHeader.OrderDate = (SELECT MAX(OrderDate)
FROM Sales.SalesOrderHeader)
GO


--vidu18
SELECT FirstName, LastName FROM Person. Person
WHERE Person.Person.BusinessEntityID IN (SELECT BusinessEntityID
FROM HumanResources.Employee WHERE JobTitle = 'Research and Development Manager' ) ;
GO


--vidu19
SELECT FirstName, LastName FROM Person. Person AS A WHERE EXISTS (SELECT *
FROM HumanResources .Employee As B WHERE JobTitle = 'Research and
Development Manager'
AND A.BusinessEntityID=B.BusinessEntityID);
GO


--vidu20
SELECT LastName, FirstName FROM Person.Person WHERE BusinessEntityID IN (SELECT
BusinessEntityID FROM Sales.Salesperson WHERE TerritoryID IN
(SELECT TerritoryID
FROM Sales.SalesTerritory
WHERE Name='Canada')
)
GO


--vidu21
SELECT e.BusinessEntityID FROM Person.BusinessEntityContact e WHERE e.ContactTypeID IN (
SELECT e.ContactTypeID FROM
Person.ContactType c
WHERE YEAR (e .ModifiedDate) >=2012)
GO


--vidu22
SELECT A.FirstName, A.LastName, B.JobTitle
FROM Person. Person A
JOIN
HumanResources.Employee B on
A.BusinessEntityID=B.BusinessEntityID;
GO

--vidu23
SELECT A.FirstName, A.LastName,B.JobTitle
FROM Person.Person A
INNER JOIN HumanResources. Employee B
ON
A.BusinessEntityID= B.BusinessEntityID;
GO

--vidu24
SELECT A.CustomerID, B.DueDate, B.ShipDate FROM Sales.Customer A LEFT OUTER JOIN
Sales.SalesOrderHeader B
ON
A.CustomerID= B. CustomerID AND YEAR (B.DueDate) <2019;
GO

--vidu25
SELECT P.Name, S.SalesOrderID FROM Sales.SalesOrderDetailS
RIGHT OUTER JOIN
Production.Product P
ON P.ProductID = S.ProductID;
GO

--vidu26
SELECT 
	p1. ProductID,
	p1.Color,
	p1.Name,
	P1.Name
FROM
Production.Product pl
INNER JOIN Production.Product p2 ON pl.Color = p2.Color
ORDER BY pl.ProductID
GO

--vidu27

GO

--vidu28
WITH CTE_OrderYear AS
(
SELECT YEAR (OrderDate) AS OrderYear, CustomerID
FROM Sales.SalesOrderHeader
)
SELECT OrderYear, COUNT(DISTINCT CustomerlD) AS CustomerCount FROM CTE_OrderYear
GROUP BY OrderYear
GO

--vidu29

GO

--vidu30
SELECT Product.ProductID FROM Production. Product UNION
SELECT ProductID FROM Sales. SalesOrderDetail
GO

--vidu31
SELECT Product. ProductID FROM Production. Product UNION ALL
SELECT ProductID FROM Sales. SalesOrderDetail
GO

--vidu32
SELECT Product. ProductID FROM Production. Product
INTERSECT
SELECT ProductID FROM Sales. SalesOrderDetail
GO

--vidu33
SELECT Product.ProductID FROM Production.Product
EXCEPT
SELECT ProductID FROM Sales.SalesOrderDetai
GO

--vidu34
SELECT TOP 5 SUM (SalesYTD) ASTotalSalesYTD, Name FROM Sales.SalesTerritory
GROUP BY Name
GO

--vidu35
SELECT TOP 5 'TotalSalesYTD' AS GrandTotal,
[Northwest], [Northeast], [Central], [Southwest],[Southeast] FROM
(SELECT TOP 5 Name, SalesYTD FROM Sales.SalesTerritory) AS SourceTable PIVOT
(SUM(SalesYTD) FOR Name IN ([Northwest], [Northeast], [Central], [Southwest], [Southeast]) ) AS
PivotTable;
GO

--vidu36

GO
