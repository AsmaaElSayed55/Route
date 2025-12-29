-- SQL Categoires:
-- 1. DDL : Data Definiation Language
-- 2. DML : Data Manipluation Language
-- 3. DQL : Data Query Language
-- 4. DCL : Data Control Language
-- 5. TCL : Transcation Control Language
------------------------------------------------
-- 1. DDL (Create - Alter - Drop) - Structure
-- 1.1. Create : To Create Database Or Any DB Object (Tables, Functions, Views, SP, ...)
-- 1.2. Alter  : To Update Database Or Any DB Object (Tables, Functions, Views, SP, ...)
-- 1.3. Drop   : To Delete Database Or Any DB Object (Tables, Functions, Views, SP, ...)
------------------------------------------------
-- 2. DML (Insert - Update - Delete) - Data
-- 2.1. Insert : Add Row Or More Into Table
-- 2.1.1. Simple Insert          : Used To Add Just only One Row
-- 2.1.2. Row Constructor Insert : Used To Add More Than One Row
-- 2.2. Update : Update Row Or More
-- 2.3. Delete : Delete Row Or More
--------------------------------------------------
-- 3. DQL (Select) - Display
-- Where
-- Like
-- Distinct
-- Order By
---------------------------------------------------
-- Joins
-- 1. Cross Join (Cartesian Product)
-- 2. Inner Join
-- 3. Outer Join
-- 3.1. Left Outer Join
-- 3.2. Right Outer Join
-- 3.3. Full Outer Join
-- 4. Self Join (Self Relationship)
-- Mulitple Table Join
-- Join + DML

-------------------------------------------------------------------------
-- Functions : Bolck Of Query
-- DRY : 
-- Function : One Of DB Objects
-- DB Objects: (Tables, Functions, Views, SP, Trigger, ...)

------------------------------
-- Types Of Functions in DB:
------------------------------
-- 1. Scalar Functions       : Return Just Only Value
-- 2. Table-Valued Functions : Return Table

-- NOTE : Function In DB Must Return Value (One Value - Table)

-- 1. User-Defined Functions
-- 2. Built-in Functions


-------------------------------------------------

Use ITI

-- Built-in Functions
-- 1. Aggregate Function:
-- Scalar Functions : Return Just Only One Value
-- Count - Sum - Avg - Max - Min

-- Count(ColumnsName OR *)

Select Count(*)
From Instructor -- 15

Select Count(Salary)
From Instructor -- 14

-- Sum(Column Name)

Select Sum(Salary)
From Instructor -- 974053.00

Select Sum(Ins_Name)
From Instructor -- Invalid

-- AVG(Column Name)

Select AVG(Salary)
From Instructor -- 69575.2142

-- 69,575.2142

Select AVG(Ins_Name)
From Instructor -- Invalid


-- Max(Column Name)

Select Max(Salary)
From Instructor -- 323423.00


Select Max(Ins_Name)
From Instructor -- Yasmin


Select Min(Salary)
From Instructor -- 2323.00


Select Min(Ins_Name)
From Instructor  -- Adel

-----------------------------------------------------
-- 2. Nulls Functions
-- 2.1. IsNull

-- IsNull(expression, replacement_value) return Value Or Null

Select St_Fname
From Student

Select St_Id, IsNull(St_Fname, IsNull(St_Lname, 'No Name'))
From Student

Select Ins_Id, IsNull(Salary, Ins_Name)
From Instructor -- Invalid

Select Ins_Id, IsNull(Ins_Name, Salary)
From Instructor

Select IsNull(St_Fname, St_Age)
From Student

-- 2.2. Coalesce

-- Coalesce(P01, P02, P03, ..... ,PN) Return Value Or Null

Select Coalesce(St_Fname, St_LName)
From Student

Select Coalesce(St_Fname, St_LName, 'No Name')
From Student

--------------------------------------------------
-- 3. Conversion Functions
-- Casting : Convert Data From Any Datatypes To Any Datatypes

-- Convert(datatype, target)

Select IsNull(St_Fname, 'No Name') + ' ' + IsNull(Convert(varchar(50), St_Age), 'No Age')
From Student


Select Coalesce(St_Fname, St_LName, 'No Name') + ' ' + IsNull(Convert(varchar(50), St_Age), 'No Age')
From Student

-- Cast(target as datatype)

Select Coalesce(St_Fname, St_LName, 'No Name') + ' ' + IsNull(Cast(St_Age as varchar(50)), 'No Age')
From Student


-- There is Another Different Between Cast And Convert When U Convert From Datetime 
-- To varchar, May Take Third Parameter int

Select GetDate() -- 2025-05-27 20:18:44.307

Select Cast(GetDate() as varchar(max)) -- May 27 2025  8:19PM

Select Convert(varchar(max), GetDate()) -- May 27 2025  8:19PM
Select Convert(varchar(max), GetDate(), 101) -- 05/27/2025
Select Convert(varchar(max), GetDate(), 102) -- 2025.05.27
Select Convert(varchar(max), GetDate(), 103) -- 27/05/2025
Select Convert(varchar(max), GetDate(), 104) -- 27.05.2025
Select Convert(varchar(max), GetDate(), 108) -- 20:22:09
Select Convert(varchar(max), GetDate(), 113) -- 27 May 2025 20:22:39:883
Select Convert(varchar(max), GetDate(), 120) -- 2025-05-27 20:22:54

Select Convert(nvarchar(max), GetDate(), 130) -- 30 ذو القعدة 1446  8:23:34:260PM
Select Convert(nvarchar(max), GetDate(), 131) -- 30 ذو القعدة 1446  8:23:34:260PM

--------------------------------------------------------
-- 4. Date And Time Functions

Select SysDateTime() -- 2025-05-27 20:25:20.6206184
Select SysUTCDateTime() -- 2025-05-27 17:25:35.9123225

Select GetDate() -- 2025-05-27 20:25:55.503

Select DAtEName(day, '5/27/2025') -- 27
Select DAtEName(weekday, '5/27/2025') -- Tuesday

Select Day('5/27/2025')
Select Month('5/27/2025')
Select Year('5/27/2025')

Select EOMonth('5/27/2025') -- 2025-05-31

Select IsDate('2025-05-31') -- 1 - True
Select IsDate('20/20/2025') -- 0 - Fales


----------------------------------------------------------------------------
-- 5. Strings Functions

-- Concat

-- Convert Any Parameter To Varchar Even Null (Empty String)
-- And Concat It

Select IsNull(St_Fname, '') + ' ' + IsNull(St_Lname, '') + ' ' + ISNULL(Convert(varchar(50), St_Age), '')
From Student

Select CONCAT(St_Fname, St_Lname, St_Age)
From Student

Select UPPER(St_Fname)
From Student

Select Upper('Ahmed')


Select Lower(St_Fname)
From Student

Select Lower('AhMed')

Select St_Fname, Len(St_Fname) as [Length Of Student FN]
From Student

Select Len('Ahmed Ali')

Select SUBSTRING('Ahmed Ali', 3, 5)

Select ASCII('a') -- 97
Select ASCII('A') -- 65



-------------------------------------------------------------------
-- Format

Select Salary
From Instructor


Select FORMAT(Salary, '###,###')
From Instructor

Select FORMAT(123456789, '###?###/###')


Select FORMAT(GETDATE(), 'd') -- 5/27/2025
Select FORMAT(GETDATE(), 'd', 'en') -- 5/27/2025
Select FORMAT(GETDATE(), 'd', 'ar') --29/11/46
Select FORMAT(GETDATE(), 'dd') -- 27
Select FORMAT(GETDATE(), 'dd', 'ar') -- 29
Select FORMAT(GETDATE(), 'ddd', 'en') -- Tue
Select FORMAT(GETDATE(), 'ddd', 'ar') -- الثلاثاء
Select FORMAT(GETDATE(), 'dddd') -- Tuesday
Select FORMAT(GETDATE(), 'dddd MM') -- Tuesday 05
Select FORMAT(GETDATE(), 'dddd MMM') -- Tuesday May
Select FORMAT(GETDATE(), 'dddd MMMM') -- Tuesday May
Select FORMAT(GETDATE(), 'dddd MMMM yy') -- Tuesday May 25
Select FORMAT(GETDATE(), 'dddd MMMM yyyy') -- Tuesday May 2025
Select FORMAT(GETDATE(), 'dddd MMMM yyyy', 'ar') -- الثلاثاء ذو القعدة 1446
Select FORMAT(GETDATE(), 'dddd MMMM yyyy', 'en') -- Tuesday May 2025
Select FORMAT(GETDATE(), 'dddd MMMM yyyy', 'fr') -- mardi mai 2025
Select FORMAT(GETDATE(), 'dd MMMM yyyy') -- 27 May 2025
Select FORMAT(GETDATE(), 'ddd MM yyyy') -- Tue 05 2025
Select FORMAT(GETDATE(), 'ddd MM yyyy hh:mm:ss tt', 'en') -- Tue 05 2025 09:07:52 PM
Select FORMAT(GETDATE(), 'ddd MM yyyy hh:mm:ss tt', 'ar') -- الثلاثاء 11 1446 09:07:59 م
Select FORMAT(GETDATE(), 'ddd MM yyyy hh:mm:ss tt', 'fr') -- mar. 05 2025 09:08:08 


---------------------------------------------------------------------

--Group By : Used Split Table to Groups


Select Dept_Id, Min(Salary)
From Instructor
Where Salary is not null
Group by Dept_Id


Select  Min(Salary)
From Instructor
Group by Ins_Id -- Invalid


--Select  Min(Salary)
--From Instructor
--Group by * -- Invalid Syntax Errors



Select Dept_Id, COUNT(*)
From Instructor
Group by Dept_Id

-- NOTE: U Can't Select Any Columns With The Agg Functions Because The Agg Functions
-- Generate Group, So If U Need To Select Any Columns With The Agg Function
-- U Must Use Group By With The Column

Select Dept_Id, Count(*)
From Student
Where Dept_Id is not null
Group By Dept_Id



Select Dept_Id, COUNT(*)
From Instructor
Group by Dept_Id
Having COUNT(*) >= 2

-- Having : Work Groups 
-- Where  : Work With Rows


Select Avg(Salary)
From Instructor
Where Avg(Salary) > 50000 -- Invalid


Select Avg(Salary)
From Instructor
Having Avg(Salary) > 50000 -- 69575.2142


Select Avg(Salary)
From Instructor
Having Avg(Salary) > 100000



Select D.Dept_Name, S.Dept_Id, COUNT(*)
From Student S, Department D
Where S.Dept_Id is not null And D.Dept_Id = S.Dept_Id -- PK = FK
Group By S.Dept_Id, D.Dept_Name
Having COUNT(*) >= 3


---------------------------------------------------------
-- Top : Used To Get Number Of Records From Begining Of Any Table

Select Top(5) *
From Student

Select Top(5) St_Id, St_Fname, St_Age
From Student

Select Top(5) St_Id, St_Fname, St_Age
From Student
Order By St_Id Desc

Select Top(5) St_Id, St_Fname, St_Age
From Student
Where St_Age is not null
Order By St_Age

----------------------------------------

-- Top With Ties


Select Top(5) St_Id, St_Fname, St_Age
From Student
Where St_Age is not null
Order By St_Age


Select Top(5) with ties St_Id, St_Fname, St_Age
From Student
Where St_Age is not null
Order By St_Age
