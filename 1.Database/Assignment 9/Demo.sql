--------- Asmaa El Sayed ----------
------------- Demo Session 9 -----------------


----------------------- Stored Procedure --------------------------
--=================================================================

-- Stored Procedure : DB Objects
-- 1. Improved Performance
-- 2. Stronger Security [Hide Metadata]
-- 3. Reduce Server Network Tarffic
-- 4. Hide Buisness Rules
-- 5. Handle Errors 
-- 6. Accept Input And Output Parameters 



-- Query Life Cycle 
-- 1. Parsing Syntax
-- 2. Optimize Metadata
-- 3. Query Tree
-- 4. Execution Plan

------------- Using Stored Procedure ----------------
----- Frist Calling 
-- Stored Procedure Life Cycle 
-- 1. Parsing Syntax
-- 2. Optimize Metadata
-- 3. Query Tree
-- 4. Execution Plan


----- Any Calling After The First Time
-- Stored Procedure Life Cycle 
-- 1. Parsing Syntax , Optimize Metadata , Query Tree  --> Their Output Is Stored 
-- 2. Execution Plan  --> Start From This Step


Use ITI

Select *
From Student


Go
Create Or Alter Procedure SP_GetStudentDataById(@StdId int) 
With Encryption
As
	Select *
	From Student
	Where St_Id=@StdId

Go

-- Not Return Table 
-- It Do the target Direct

-- two ways , But if I pass Parameter as variable i Must write Execute
SP_GetStudentDataById 1
Execute SP_GetStudentDataById 1

Declare @Id int =5

--SP_GetStudentDataById @Id    -- Invalid
Execute HR.SP_GetStudentDataById @Id   -- Valid

SP_HelpText 'SP_GetStudentDataById' -- The text for object 'SP_GetStudentDataById' is encrypted.


------------------- Transfer Stored Procedure
Create Schema HR

Alter Schema HR
Transfer SP_GetStudentDataById

----------------------------------------- 

Go
Create Or Alter Procedure SP_GetInstructorDataByDeptId(@DeptId int) 

As
	Select *
	From Instructor
	Where Dept_Id=@DeptId

Go

Execute SP_GetInstructorDataByDeptId 20   -- Valid

SP_HelpText 'SP_GetInstructorDataByDeptId' -- The text for object 'SP_GetStudentDataById' is encrypted.






