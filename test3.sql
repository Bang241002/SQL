--tạo databases
Create Database Student
GO

USE Student
Go

-- bảng class
Create table Class(
		classID int primary key,
		ClassName nvarchar(200),
)

Go
--bảng subjects
Create table subjects(
		SubjectsID int primary key, 
		SubjectsName nvarchar(200),
		teacher nvarchar(200),
		ClassID int foreign Key references Class(ClassID)
)

Go

--bảng student
Create Table Students (
		StudrnID int primary key,
		StudentName nvarchar(200),
		ClassID int foreign key references Class(ClassID),
		SubjectID int foreign key references Subjects(SubjectsID),
)

Go

--insert dữ liệu
Insert into class Values  (1,N't2109m'),
						  (2,N't2109m'),
						  (3,N't2109m'),
						  (4,N't2109m'),
						  (5,N't2109m'),

Go


Insert into Students values (1,N'nguyễn văn a',1),
							(2,N'nguyễn văn b',4),
							(3,N'nguyễn văn c',3),
							(4,N'nguyễn văn d',2),
							(5,N'nguyễn văn e',2),
Go
