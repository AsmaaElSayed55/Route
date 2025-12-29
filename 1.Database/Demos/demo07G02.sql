-- Revision
-- SubQuery 
-- Ranking Functions
-- 1. Row_Number()
-- 2. Dense_Rank()
-- 3. Rank()
-- 4. NTile(int) Take Parameter
-- Execution Order 
-- Union Family
-- Select Into And Insert Based On Select
-- Drop vs Delete vs Truncate : Delete
-- Relationship Rules
-- Schema
-- dbo



----------------------------------------------------------------------


-- Functions : DB Objects
--           : Block Of Query

-- User-Defined Functions

-- Types Of Functions In DB:
-- 1. Scalar Functions       : Return Just Only One Value 
-- 2. Table-Valued Functions : Return Table
-- 2.1. Inline Table-Valued Functions           : (Return Table)
-- 2.1. Multistatments Table-Valued Functions	: (Return Table)

-- NOTE: 
-- Functions In DB Must Return A Value
-- Functions May Take Parameters Or Not

-- Any Functions Consists Of 2:
-- 1. Signature (Name, Parameters, Return Types)
-- 2. Body (Code) [Select Statments Or Insert Based On Select]


-- UDF:
-- 1. Scalar Functions
-- Return Just Only One Value
-- Ex01:
-- Create Function That Take Student Id And Return His Full Name


Create Function GetStudentNameByStdId(@StdId int) 
Returns varchar(50) -- Return Type
Begin
	-- Code

	Declare @StdName varchar(50) 

	Select @StdName = St_Fname + ' ' + St_Lname
	From Student
	Where St_Id = @StdId

	Return @StdName
End



Select dbo.GetStudentNameByStdId(1) -- Ahmed Hassan    
Select dbo.GetStudentNameByStdId(2) -- Amr Magdy         
Select dbo.GetStudentNameByStdId('3') -- Mona Saleh             
Select dbo.GetStudentNameByStdId('Ali') -- Invalid            


print dbo.GetStudentNameByStdId(1)

-- Ex02:
-- Create Function That Take Department Name And Return Name Of Its Manager



print dbo.GetDeptManagerByDeptName('SD')
print dbo.GetDeptManagerByDeptName('EL')
print dbo.GetDeptManagerByDeptName('HR')
Select dbo.GetDeptManagerByDeptName('HR')


-- UDF: 2. Table-Valued Functions
-- Return Table

-- 2.1. Inline Table-Valued Functions
-- Return Table [One Select]
-- Ex 01:
-- Create Function That Take Department Id And Return All Instructor That
-- Work in This Department


Select Ins_Id, Ins_Name, Dept_Id
From Instructor
Where Dept_Id = 10


Create Function GetInstructorDataByDeptId(@DeptId int)
Returns Table
As Return(
	-- Code
	Select Ins_Id, Ins_Name, Dept_Id
	From Instructor
	Where Dept_Id = @DeptId
)


Select * From GetInstructorDataByDeptId(10)
Select * From GetInstructorDataByDeptId(20)
Select * From GetInstructorDataByDeptId(200)










-- 2.2. Multistatment Table-Valued Functions 
--[Return Table With Logic (if, While, declare var, ... etc)]

-- EX : 
-- Create Function That Take Format [first, last or full] And Return Student Name
-- Based On Format

-- StdId, StdName

Create Function GetStudentNameBasedOnFormat(@Format varchar(50))
Returns @T Table (StdId int, StdName varchar(50))
As 
	Begin
		-- Logic
		if @Format = 'first'
		-- Statment
			Insert Into @T
			Select St_Id ,St_Fname
			From Student
		
		else if @Format = 'last'
		-- statment
			Insert Into @T
			Select St_Id ,St_Lname
			From Student
		
		else if @Format = 'full'
		-- statment
			Insert Into @T
			Select St_Id ,St_Fname + ' ' + St_Lname
			From Student

		Return
	End


Select * From GetStudentNameBasedOnFormat('first')
Select * From GetStudentNameBasedOnFormat('last')
Select * From GetStudentNameBasedOnFormat('full')

--------------------------------------------------------

-- Views: DB Objects
-- Block Of Query
-- Saved Query as Virtual Table
-- 1. Simplfy Query
-- 2. Hidding Metadata [Columns, Tables]
-- 3. Abstract The Logic Of Query

Create view V01
as
Select S.St_Fname, D.Dept_Name, S.St_Address
From Student S, Department D
Where D.Dept_Id = S.Dept_Id And S.St_Address = 'Cairo' -- PK = FK



Select  St_Id, St_Fname, St_Age
From Student

Create View V_StudentData
as 
	Select  St_Id, St_Fname, St_Age
	From Student


Select * From V_StudentData


Select * From V01


-- UDF Views
-- 1. Standard View

Select St_Id, St_Fname, St_Address
From Student
Where St_Address = 'Cairo'



Create View V_CairoStudent
as 
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address = 'Cairo'




Select * FRom V_CairoStudent
Select St_Id, St_Address FRom V_CairoStudent




Create Or Alter View V_CairoStudent
as 
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address = 'Cairo'

Select * FRom V_CairoStudent




Create Or Alter View V_AlexStudent
as 
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address = 'Alex'



Select * From V_AlexStudent




Select  S.St_Id, S.St_Fname, D.Dept_Id, D.Dept_Name
FRom Student S, Department D
Where D.Dept_Id = S.Dept_Id -- PK= FK



Create Or Alter View V_StudentInDepartment
as 
	Select  S.St_Id, S.St_Fname, D.Dept_Id, D.Dept_Name
	FRom Student S, Department D
	Where D.Dept_Id = S.Dept_Id -- PK= FK



Select * From V_StudentInDepartment


Select * From V_StudentInDepartment
Where Dept_Id = 10







SP_HelpText 'V_StudentInDepartment'



Create Or Alter View V_StudentInDepartment
With Encryption
as 
	Select  S.St_Id, S.St_Fname, D.Dept_Id, D.Dept_Name
	FRom Student S, Department D
	Where D.Dept_Id = S.Dept_Id -- PK= FK


SP_HelpText 'V_StudentInDepartment'
-- The text for object 'V_StudentInDepartment' is encrypted.




Select * From V_StudentInDepartment



Create Or Alter View V_StudentInDepartment(StdId, StdName, DId, DName)
With Encryption
as 
	Select S.St_Id, S.St_Fname, D.Dept_Id, D.Dept_Name
	FRom Student S, Department D
	Where D.Dept_Id = S.Dept_Id -- PK= FK


Select * From V_StudentInDepartment





-- 2. Partitioned View

Create Or Alter View V_CairoAlexStudents
as
	Select * From V_CairoStudent
	Union All
	Select * From V_AlexStudent

Select * FRom V_CairoAlexStudents
Select St_Id, St_Fname FRom V_CairoAlexStudents



-- View ==> Virtual Table

-- View + DML (Insert - Update - Delete)

Select * From V_CairoStudent

-- Insert

Insert Into V_CairoStudent Values(30, 'Amr', 'Cairo')



Create Or Alter View V_StudentNameWithAge
As
	Select St_Fname, St_Age
	From Student


Select * FRom V_StudentNameWithAge


Insert Into V_StudentNameWithAge Values('Khaled', 40) -- Invalid

Select * From V_StudentInDepartment

Insert Into V_StudentInDepartment Values(50, 'Ali', 90, 'HR') -- Invalid
Insert Into V_StudentInDepartment(StdId, StdName) Values(50, 'Ali') -- Valid
Insert Into V_StudentInDepartment(DId, DName) Values(90, 'HR') -- Valid


Select * From V_CairoStudent

Update V_CairoStudent
Set St_Fname = 'Omar'
Where St_Id = 2


Delete From V_CairoStudent
Where St_Id = 30

Select * From V_CairoStudent

Insert Into V_CairoStudent Values (80, 'Amr', 'Cairo')
Insert Into V_CairoStudent Values (90, 'Mona', 'Alex')


Select * From V_AlexStudent

Create Or Alter View V_CairoStudent
as 
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address = 'Cairo' with check option


Update V_CairoStudent
Set St_Address = 'Alex'
Where St_Id = 2

