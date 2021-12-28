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
SELECT*FROM Person.Address WHERE City='Bothell'
Go

--vidu12
USE AdventureWorks2019
SELECT*FROM HumanResources.Department WHERE DepartmentID<10
GO


--vidu13
USE AdventureWorks2019
SELECT*FROM Person.Address WHERE AddressID > 900 AND City='Seattle'
GO


--vidu14
USE AdventureWorks2019
SELECT*FROM Person.Address WHERE AddressID > 900 OR City='Seattle'
GO


--vidu15
USE AdventureWorks2019
SELECT*FROM Person.Address WHERE NOT AddressID =5
GO


--vidu16
SELECT WorkORderID, SUM(ActualResourceHrs) FROM Production.WorkOrderRouting GROUP BY WorkOrderID
GO


--vidu17
USE AdventureWorks2019
SELECT WorKOrderID, SUM(ActualResourceHrs) FROM Production.WorkOrderRouting GROUP BY WorkOrderID HAVING WorkOrderID < 50
GO


--vidu18
SELECT * FROM Sales.SalesTerritory ORDER BY SalesLastYear
GO


--vidu19
CREATE TABLE Person.PhoneBilling(Bill_ID int PRIMARY KEY, MobileNumber bigint UNIQUE, CallDetails xml )
GO 


--vidu20
USE AdventureWorks2019
INSERT INTO Person.PhoneBilling VALUES (100,9833276605,
'<info><Call>local</Call><Time>45minutes</Time><Charges>200</Charges></info>'
)
SELECT CallDetails FROM person.PhoneBilling
GO


--vidu21
DECLARE @xmlvar xml
SELECT @xmlvar ='<Employee name="Joan"/>'
GO


--vidu22
CRE
A' AS
N
<xsd
IE XML SCHEMA COLLECTION SoccerSchemaCollection
'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
:element name="MatchDetails">
:complexType>
:complexContent>
:restriction base="xsd:anyType">
:sequence>
:element name="Team" minOccurs="0" maxOccurs="unbounded">
:complexType>
:complexContent>
:restriction base="xsd:anyType">
:sequence />
GO


--vidu23
CREATE TABLE SoccerTeam (TeamID int identity not null, TeamInfo xml (SoccerSchemaCollection) )
GO


--vidu24
INSERT INTOSoccerTeam (Team info) VALUES (XMatch DetailsX Team country="Australia"
score="3"x/TeamXTeamcountry="Zimbabwe•,
score="2"X/TeamXTeam
country= "England"score="4"x/Teamx/MatchDetails>')
GO


--vidu25
DECLARE Steam xml (SoccerSchemaCollection)
SETSteam= ’<MatchDetails><Teamcountry="Australia”></Team></MatchDetails>* SELECT Steam
GO