--=================================================================
------------------------ Execution Order --------------------------
--=================================================================

Select CONCAT_WS(' ' , St_Fname , St_Lname) FullName
From Student
Where FullName = 'Ahmed Hassan' -- Invalid column name 'FullName'

Select CONCAT_WS(' ' , St_Fname , St_Lname) FullName
From Student
Order by FullName -- Valid 

-- Execution Order 

Select FullName
From ( Select CONCAT_WS(' ' , St_Fname , St_Lname) FullName
       From Student ) As StudentFullNames
Where FullName = 'Ahmed Hassan'

--=================================================================
------------------------- Union Family ----------------------------
--=================================================================
-- Union - Union All - Intersect - Except 

Select St_Fname From Student
union 
Select Ins_Name From Instructor

Select St_id , St_Fname From Student -- Invalid
Union
Select Ins_Name From Instructor 
-- All queries combined using a UNION, INTERSECT or EXCEPT operator must have 
-- an equal number of expressions in their target lists.


Select St_id , St_Fname From Student -- Invalid
Union
Select Ins_Name , Ins_Id From Instructor 
-- Conversion failed when converting the nvarchar value 'Ahmed' to data type int.


Select St_id , St_Fname From Student -- Invalid
Union
Select Ins_Name , Ins_Id From Instructor 

--=================================================================
----------------------------- Schema ------------------------------
--=================================================================

Create Table [Server].[Database].[Schema].Test 
(

)

-- Dbo : Database Owner [Default Schema]

Select *
From [LAPTOP-LJC895S6].[ITI].[Dbo].Student

Select *
From Student

Select *
From MyCompany.dbo.Employee


-- Create Schema [Structure]
-------------------------------------------------------------------
go
Create Schema HR
go 
-- Transfer Database Object From Schema To Another Schema
-------------------------------------------------------------------
Alter Schema HR
Transfer Student

Select *
From Student -- Invalid object name 'Student'

Select *
From HR.Student 

Alter Schema dbo
Transfer HR.Student

Select *
From Student -- Valid 

-- Create New Table Department
-------------------------------------------------------------------

Create Table Department
(Id int Primary key) -- There is already an object named 'Department' in the database

Create Table HR.Department 
(Id int Primary key) 
-- Valid Created In Schema HR


-- Drop Schema
-------------------------------------------------------------------

Drop Schema HR
--  Cannot drop schema 'HR' because it is being referenced by object 'Department'.

-- Drop Table Then Drop Schema
Drop Table HR.Department
Drop Schema HR

--=================================================================
-------------------------- Select Into ----------------------------
--=================================================================
Select * into NewProject
From MyCompany.dbo.Project

Select Pname , Pnumber into NewProject02
From MyCompany.dbo.Project

Select Pname , Pnumber into HR.NewProject02
From MyCompany.dbo.Project
     
Select Plocation , City into HR.NewProject03 -- Plocation , City Has Null Values
From MyCompany.dbo.Project
     
Select * into NewProject04
From MyCompany.dbo.Project
Where 1 = 2

Select Plocation , City into NewProject05
From MyCompany.dbo.Project
Where 1 = 2

Select *
into NewTable
From CompanyG01.dbo.Employees

--=================================================================
-------------------- Insert Based On Select  ----------------------
--=================================================================
Insert into NewProject04
Select * From MyCompany.dbo.Project

Insert into NewProject05
Select * From MyCompany.dbo.Project
-- Invalid Column name or number of supplied values does not match table definition.

Insert into NewProject05
Select Plocation , City From MyCompany.dbo.Project

Select Pname , Pnumber into NewProject06
From MyCompany.dbo.Project
Where 1 = 2

Insert into NewProject06(Pnumber)
Select Pnumber  From MyCompany.dbo.Project

--=================================================================
---------------- Delete Vs Drop Vs Truncate -----------------------
--=================================================================

Drop Table NewProject 
-- Drop Table Structure With Data 

Delete From NewProject02 
-- Delete All Records From Table NewProject02 Doesn't Affect Structure

Truncate Table NewProject04
-- Removes all rows from a table without logging the individual row deletions



Create Table Hamda 
(id int primary key Identity , 
Name varchar(10) )

insert into Hamda
Values ('X') , ('Y') , ('Z')

Select * From Hamda  -- 1 , X -- 2 , Y  -- 3 , Z

Delete  From Hamda

insert into Hamda
Values ('X') , ('Y') , ('Z') -- 4 , X -- 5 , Y  -- 6 , Z

Truncate Table Hamda

insert into Hamda
Values ('X') , ('Y') , ('Z') -- 1 , X -- 2 , Y  -- 3 , Z

--=================================================================
------------------- Delete And update Rules -----------------------
--=================================================================
-- Delete Rule 
Delete From Department
Where Dept_Id = 10
-- The DELETE statement conflicted with the REFERENCE constraint "FK_Student_Department".
-- The conflict occurred in database "ITI", table "dbo.Student", column 'Dept_Id'.

-- 1. Cascade
     Delete From Student
	 Where Dept_Id = 10

-- 2. Set Null 
     Update Student
	 Set Dept_Id = NULL
	 Where Dept_Id = 10

-- 3. Set Default 
     Update Student
	 Set Dept_Id = 20
	 Where Dept_Id = 10
     

    Delete From Department
    Where Dept_Id = 10
--The DELETE statement conflicted with the REFERENCE constraint "FK_Instructor_Department". 
-- The conflict occurred in database "ITI", table "dbo.Instructor", column 'Dept_Id'.

-- 1. Cascade
     Delete From Instructor
	 Where Dept_Id = 10

-- 2. Set Null 
     Update Instructor
	 Set Dept_Id = NULL
	 Where Dept_Id = 10

-- 3. Set Default 
     Update Instructor
	 Set Dept_Id = 20
	 Where Dept_Id = 10
   
   
    Delete From Department
    Where Dept_Id = 10 -- Deleted successfully 



-- Set Delete Rule For Student-Department RelationShip Cascade 
-- Set Delete Rule For Instructor-Department RelationShip Set Null 

    Delete From Department
    Where Dept_Id = 40
-- The DELETE statement conflicted with the SAME TABLE REFERENCE constraint "FK_Student_Student". 
-- The conflict occurred in database "ITI", table "dbo.Student", column 'St_super'.

-- Self Relationship Rules Using Code Only 
   Update Student
   Set St_super = NULL
   Where St_super in (Select st_Id 
                      From Student
					  Where Dept_Id = 40)
	Update Std
    Set St_super = NULL
	From Student Std , Student SuperVisors
	Where SuperVisors.St_Id = Std.St_super And SuperVisors.Dept_Id = 40

    Delete From Department
    Where Dept_Id = 40 -- Deleted successfully 

-- Set Relationship Rule Code 

	Create table Test 
	(Id int Primary key , 
	Testing int References Student(st_Id) ON DELETE CASCADE
	)


--=================================================================
-------------------- User Defined Functions -----------------------
--=================================================================
-- Scalar Function 
-------------------------------------------------------------------
-- Create Function Take Id Of Student And Returns His Full Name 
-------------------------------------------------------------------
Go
Create Function GetStudentNameById (@Id int)
Returns Varchar(50)
Begin 
   Declare @studentName Varchar(30)
   Select @studentName = CONCAT_WS(' ' , St_Fname , St_Lname)
   From Student
   Where St_Id = @Id
   Return @studentName
End
Go
Select dbo.GetStudentNameById(1) [Full Name]
Select dbo.GetStudentNameById('1') [Full Name]
Select dbo.GetStudentNameById('Aliaa') [Full Name] -- Invalid
Print dbo.GetStudentNameById(1) 

-------------------------------------------------------------------
-- Create Function Take Department Name And Return Name Of Its Manager
-------------------------------------------------------------------
Use MyCompany
GO 
Create Function GetDepartmentManagerByDeptName(@DeptName varchar(20))
Returns Varchar(20)
Begin 
    
	Declare @Manager Varchar(20)
	Select @Manager= Emp.Fname
	From Employee Emp Inner Join Departments Dept
	On Dept.Dnum = Emp.Dno And Dept.Dname = @DeptName
	Return @Manager
End
Go

Select dbo.GetDepartmentManagerByDeptName('DP1')

Drop Function GetDepartmentManagerByDeptName
go
Create Schema HR 
go
Create Function HR.GetDepartmentManagerByDeptName(@DeptName varchar(20))
Returns Varchar(20)
Begin 
    
	Declare @Manager Varchar(20)
	Select @Manager= Emp.Fname
	From Employee Emp Inner Join Departments Dept
	On Dept.Dnum = Emp.Dno And Dept.Dname = @DeptName
	Return @Manager
End
Go

Select HR.GetDepartmentManagerByDeptName('DP1')
Drop Function GetDepartmentManagerByDeptName -- Drop Function in dbo (Default Schema)
Drop Function HR.GetDepartmentManagerByDeptName -- Drop Function in HR 

-------------------------------------------------------------------
-- Alter Function GetDepartmentManagerByDeptName
-------------------------------------------------------------------
Create Function GetDeptManagerByDeptName (@DeptName varchar(20))
Returns varchar(20)
Begin 
  Declare @managerName Varchar(20)
   
   Select @managerName = Emp.Fname
   From Departments Dept Inner Join Employee Emp 
   On Emp.SSN = Dept.MGRSSN And Dept.Dname = @DeptName
   Return @managerName
End 

Select dbo.GetDepartmentManagerByDeptName('DP1') -- Invalid object name 'Department'

Alter Schema HR
Transfer GetDepartmentManagerByDeptName



-- Inline table-valued function
-------------------------------------------------------------------
-- Create Function That Take Department Id 
-- and Return Instructors That Works In It
-------------------------------------------------------------------
use ITI
Go

CREATE Function GetInstructorsByDeptId(@id int)
Returns Table 
As
   Return 
   (  Select ins_Id , ins_name , Salary , Dept_Id
      From Instructor
      Where Dept_id = @id  
   )

Select * From GetInstructorsByDeptId(10)
 


-- Multi-Statement Table-valued function
-------------------------------------------------------------------
-- Create Function That Take Format And Return Student Name Based  On Format (First , Last , Fullname)
-------------------------------------------------------------------
Create Function GetStudentNameBasedOnFormat (@Format varchar(20))
Returns @Data Table  ( StdId int ,  StdName varchar(50) )
AS
Begin 
   if @Format = 'First'
     Insert into @Data
	 Select St_id , St_Fname
	 From Student
   Else If @Format = 'Last'
     Insert into @Data
	 Select St_id , St_Lname
	 From Student
   Else If  @Format = 'Fullname'
     Insert into @Data
	 Select St_id , CONCAT_WS(' ' , St_Fname , St_Lname)
	 From Student
	 Return
End 
Select * From GetStudentNameBasedOnFormat('Fullname')
