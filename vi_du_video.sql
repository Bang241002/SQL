USE AdventureWorks2019
Go

-- lấy ra dữ liệu của bảng contact có contactTypeID >= 3 và contactType Id<=9
SeLECT *
FROM Person.ContactType
WHERE ContactTypeID >= 3 And  ContactTypeID <=9

--lấy ra dữ liệu của bảng contact có ContacttypeId trong đoạn [3, 9]
SELECT * FROM Person.ContactType
WHERE ContactTypeID BETWEEN 3 AND 9
 
--lấy ra dữ liệu của bảng Contact có ContactTYpeID trong tập hợp (3, 5, 9)
SELECT * FROM Person.ContactType
WHERE ContactTypeID IN (1,3,5,9)
 
 --lấy ra những Contact có LastName kết thúc bởi ký tự e 
 SELECT * FROM Person.Person
 WHERE LastNAME LIKE '%e'
 --lấy ra những CONtact có LastNAme bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
  SELECT * FROM Person.Person
 WHERE LastNAME LIKE '[RA]%e'
 --lấy ra những contact có lastname  có 4 ký tự bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
  SELECT * FROM Person.Person
 WHERE LastNAME LIKE '[RA]__e'

 --sử dụng DISTINCT các dữ liệu trùng lặp bị loại bỏ
 SELECT DISTINCT Title FROM Person.Person

 --sử dụng GROUP BY các dữ liệu trùng lặp được gộp thành nhóm
 SELECT Title
 FROM Person.Person
 GROUP BY Title


 --do đó ta cso thể sử dụng được với các hàm tập hợp
 SELECT Title, COUNT(*) AS [Title Number]
 FROM Person.Person
 GROUP BY Title

 --ra có thể sử dụng mệnh đề WHERE để thoả mãn điều kiện tìm kiếm
 SELECT Title, COUNT(*) [Title Number]
 FROM Person.Person
 WHERE Title LIKE 'Mr%'
 GROUP BY Title

 --GROUP BY với ALL sẽ lấy ra các hàng bị loại bỏ bởi mệnh đề WHERE 
 --(vì mệnh đề WHERE sẽ lọc kết quả sau khi đã được gộp nhóm)
 SELECT Title, COUNT(*) [Title Number]
 FROM Person.Person
 WHERE Title LIKE 'Mr%'
 GROUP BY ALL Title

 --GROUP BY với having: mệnh đề having sẽ lọc hết quả trong lúc gộp nhóm
 SELECT Title, COUNT(*) [Title Number]
 FROM Person.Person
  WHERE Title LIKE 'Mr%'
 GROUP BY ALL Title
 HAVING COUNT(*) > 10


 --GROUP BY với CUBE: sẽ có thêm một hàng siêu kết hợp tất cả các hàng trong tập trả về 
 SELECT Title, COUNT(*) [Title Number]
 FROM Person.Person
 GROUP BY Title WITH CUBE

 --ORDER BY dùng để sắp xếp kết quả trả về
 SELECT * FROM Person.Person
 ORDER BY FirstName, LastName DESC 

 /*
	truy vấn từ nhiều bảng
	lấy toàn bộ Contact của nhân viên (HUmanResources.EMployee)
 */
  SELECT * FROM Person.Person
   SELECT * FROM HUmanResources.EMployee

--truy vấn con
 SELECT * FROM Person.Person
 WHERE BusinessEntityID in (
	SELECT BusinessEntityID
	FROM HumanResources.Employee
 )

--truy vấn quan hệ sử dụng EXIST
 SELECT * FROM Person.Person C
 WHERE EXISTS (
			SELECT BusinessEntityID
			FROM HumanResources.Employee
			WHERE BusinessEntityID=C.BusinessEntityID
 )

 --kết hợp dữ liệu sử dụng UNION
 SELECT ContactTypeID, Name
 FROM Person.ContactType
 WHERE ContactTypeID IN (1,2,3,4,5,6)
 UNION
 SELECT ContactTypeID, Name
 FROM Person.ContactType
 WHERE ContactTypeID IN (1,3,5,7)


 --UNION với ALL Không loại bỏ giá trị trùng lặp
 SELECT ContactTypeID, Name
 FROM Person.ContactType
 WHERE ContactTypeID IN (1,2,3,4,5,6)
 UNION ALL
 SELECT ContactTypeID, Name
 FROM Person.ContactType
 WHERE ContactTypeID IN (1,3,5,7)


--sử dụng INNER JOIN
SELECT *
FROM HumanResources.Employee AS e
	INNER JOIN Person.Person AS p
	ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY p.LastName

--MULTIPLE OPERATOR

SELECT DISTINCT p1.ProductSUbcategoryID, p1.ListPrice
FROM Production.Product p1 INNER JOIN Production.Product p2
	ON p1.ProductSubcategoryID = p2.ProductSubcategoryID AND p1.ListPrice <>p2.ListPrice
WHERE p1.ListPrice <$15 ANd p2.ListPrice < $15
ORDER BY ProductSubcategoryID;