------------ Asmaa El Sayed --------------
------------ Demo Session 7 --------------
---------------------------------------------------------


------------------------- Execution Order -------------------------
--=================================================================
-- 1. From / Join - on 
-- 2. Where 
-- 3. Group By 
-- 4. Having 
-- 5. Select 
-- 6. Distinct 
-- 7. Order By 
-- 8. Top
 
Select *
From ( Select CONCAT_WS(' ' ,St_Fname , St_Lname ) As 'Full_Name' 
From Student ) As StudentFullName
Where Full_Name = 'Amr Magdy'

--=================================================================

------------------------- Union Family ----------------------------
--=================================================================
-- Union Family : Combine Two Results 

-- Union - Union All - Intersect - Except 

-- Union : Get All Values From Two Sets Without Duplication
Select St_Fname From Student
union 
Select Ins_Name From Instructor

--

-- Union All : Get All Values From Two Sets With Duplication
Select St_Fname From Student
union All
Select Ins_Name From Instructor

--

-- Intersect : Get Common Values From Two Sets
Select St_Fname From Student
Intersect
Select Ins_Name From Instructor

--

-- Except : Get The Values that there are in the first Set and there aren't in the other Set
Select St_Fname From Student
Except
Select Ins_Name From Instructor

--

Select Ins_Name From Instructor
Except
Select St_Fname From Student

------------------------ InValid 

Select St_id , St_Fname From Student -- Invalid
Union
Select Ins_Name From Instructor 
-- All queries combined using a UNION, INTERSECT or EXCEPT operator must have 
-- an equal number of expressions in their target lists.

Select St_id , St_Fname From Student -- Invalid
Union all
Select Ins_Name , Ins_Id From Instructor 
-- Conversion failed when converting the nvarchar value 'Ahmed' to data type int.

Select St_id , St_Fname From Student -- Invalid
Except
Select Ins_Name , Ins_Id From Instructor 

Select St_id , St_Fname From Student -- Invalid
Intersect
Select Ins_Name , Ins_Id From Instructor 

Select St_id , St_Fname From Student -- Invalid
Intersect
Select Ins_Name From Instructor 

--

--------------------------- Select Into ---------------------------
--=================================================================

-- DDL - Structure ( Create - Alter - Drop - Select Into )
-- Select Into ( Copy ) 
-- 1. Copy Table : structure With Data 
-- Copy Specific Content From The Table To New Table 
-- I Take Data Only Without Any Relationship
Select * Into New_Student_Table_Data
From Student


Select St_Fname , St_Lname Into New_Student_Only_Name
From Student



-- 2. Copy Table Structure Without data 
-- Copy Only Structure From The Table To New Table 
-- I Take Structure Only Without Any Relationship
Select * Into New_Student_Table_Structure
From Student
Where 1=3  -- Put Imposible Condition


Select *
From New_Student_Table_Structure

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

--


--------------------- Insert Based On Select ----------------------
--=================================================================

-- Insert Data To Empty Table From Another Table has the same columns with the same arrangement 
Insert Into New_Student_Table_Structure
Select * From Student

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

--


----------- Deffirent Between Drop , Delete , Truncate ------------
--=================================================================

-- Drop  : DDL Used For Delete Database Or Any DB Objects (Tables , Functions , Views , SP , Trigger)
Drop Table New_Student01
-- Drop Table Structure With Data


-- Delete  : DML Used For Delete Row Or More 
Delete from New_Student_Only_Name
-- Delete All Records From Table 'New_Student_Only_Name' Doesn't Affect Structure

Delete from New_Student
Where St_Id =1344
-- Allow Conditions 
-- Delete All Records From Table 'New_Student_Only_Name' Doesn't Affect Structure


-- Truncate  : DDL Used To Dalete Table And Re-Create It ( It Handle its Relationships )
Truncate Table New_Student_Table_Data
-- Remove All Rows From Table 'New_Student_Table_Data' Without Logging LDF
-- Don't Allow Conditions 
-- Affect Identity


Create Table Test 
(
id int Primary Key Identity ,
Name Varchar(10)
)

-- Delete 





------------------------ Relationship Rules -----------------------
--=================================================================


------------ Delete Rule ------------
Delete From Instructor
Where Ins_Id = 1 -- Invalid

----- Solutions -----
-- 1. Delete 
Delete From Department
Where Dept_Manager =1 

Delete From Instructor
Where Ins_Id =1 

Delete From Ins_Course
Where Ins_Id =1 


-- 2. Set Its Values Null ' Must Allow Null '
Update Instructor
Set Dept_Id =null
Where Dept_Id = 10 -- If I Want To Delete Department With Id 10 and Dept_Id In Instructor table Allow Null


-- 3. Update (Change) Its Data ' Edit Them Manual '
Update Student 
Set Dept_Id =20
Where Dept_Id =10 -- If I Want To Delete Department With Id 10

------------ Update Rule -----------

Create Table Employee 
(
	id int Primary Key Identity(1,1),
	DNum int references Department(dept_id) on delete cascade
	-- DNum int references Department(dept_id) on Update Set default
)




----------------------------- Schema ------------------------------
--=================================================================

-- Server   -> Databases
-- Database  -> Schema
-- Schema   -> DB Objects (Tables , Functions , Views , SP , Triggers , .... )

-- Dbo : Database Owner [Default Schema]

------------------------------------------
-- Schema Solved 3 Problems :
-- 1. U Can't Create More Than One DB Objects With The Same Name 
	-- [ Tables , Views , Functions , ..... ]
-- 2. There Is No Logical Meaning [Logical Name]
-- 3. Permissions 

-- 
Create Table [Server].[Database].[Schema].Test 
(

)


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

--

 --------------- User Defined Functions -----------------
 ------------ Scalar Functions 
