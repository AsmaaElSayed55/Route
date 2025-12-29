
USE Northwind

Select * From Categories


-- One Line Comment
-- Comment ctrl K + C
-- UbComment ctrl K + U

/*
fsdf
sdfdsf
sdfdsf
sdfsdf
*/

-----------------------------------------------------------------------

-- SQL : Structure Query Language

-- Variables : 

-- Global Variables
-- Start @@
--print @@VerSion
--Select @@VERSION

--Print @@ServerName
--Select @@ServerName
--Print @@Language

-- Local Variables
-- start @

--declare @Age int = 30

--print @Age

--declare @Name varchar(20) = 'Ahmed Ali'

--print @Name

--Set @Name = 'Omar Ahmed'

--print @Name

---------------------------------------------------------------------

-- Datatypes : Size 

---------------------------------------------------------------------

-- SQL Categories:
-- 1. DDL: Data Definiation Language (Create - Alter - Drop)
-- 1.1. Create 

-- To Create Database:

Create Database CompanyG02

-- To Select DB
USE CompanyG02

-- To Create Tables

-- 1 2 3 4 5
Create Table Employees
(
	SSN int primary key Identity(1,1),
	FName varchar(30) not null, -- required
	LName varchar(30),
	Gender char(1) default 'M',
	BirthDate date,
	DNum int,
	Super_SSN int references Employees(SSN)

)

-- 10 20 30
Create Table Departments
(
	DNum int primary key Identity(10,10),
	DName varchar(30) not null,
	Manager_SSN int references Employees(SSN),
	Hiring_Date date
)

Create Table Departments_Locations
(
	DNum int references Departments(DNum),
	Location varchar(40) default 'cairo',
	
	primary key(DNum,Location) -- Composite PK
)

Create Table Projects
(
	PNum int primary key Identity(100,100),
	PName varchar(40),
	Location varchar(30),
	City varchar(30) default 'cairo',
	DNum int references Departments(DNum)
)

Create Table Dependents
(
	Name varchar(30) unique,
	birthdate date,
	Gender char(1),
	ESSN int references Employees(SSN),

	primary key (Name, ESSN)
)

Create Table Employees_Projects
(
	ESSN int references Employees(SSN),
	PNum int references Projects(PNum),
	NumOfHours int,

	primary key(ESSN, PNum)
)


-- 1.2. Alter - Update

-- To Alter Database Name
Alter Database Inheritance
modify name = hamada

-- Use Alter With Table
-- 1. Add (Columns, Constrants)
-- 2. Alter (Columns Datatypes)
-- 3. Drop  (Columns, Constratins)

Alter Table Employees
Add Test int

Alter Table Employees
Alter Column Test Bigint

Alter Table Employees
Drop Column Test


Alter Table Employees
Add Foreign key(DNum) references Departments(DNum)


-- 3.1. Drop - Delete
Drop Database hamada

Create Table Test(id int)

Drop Table Test


