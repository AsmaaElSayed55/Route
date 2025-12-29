-- Revision:
-- 1. Functions: DB Objects
-- Types Of Functions:
-- 1. Scalar Functions : Return Just Only One Value
-- 2. Table-Valued Function : Return Table
-- 2.1. Inline Table-Valued Functions         : (Return Table)
-------- Body Contain Single Query [Select Statments]
-- 2.1. Multistatment Table-Valued Functions  : (Return Table)
------- Body Cotain Logic (if, While, Declare var, ...., etc)
-- UDF:
-- Any Functions Consists Of 2:
-- 1. Signature (Name, Parameter, Return Types) 
-- 2. Body => Code (Select Statments, Insert Based On Select)

-- NOTE:
-- 1. Functions in DB Must Return Value (One Value, Table)
-- 2. Function in DB May Take Parameters Of Not
-----------------------------------------------------
-- 2. View : DB Objects
-- Saved Query as Virtual Table
-- Body Of View Select
-- Benifits:
-- 1. Simplfiy Query
-- 2. Hidding All Meta Data
-- 3. Abstract Logic Of Query

-- Types Of Views:
-- 1. Standard View
-- 2. Partioned View
-- 3. Indexed View

-- View + DML
-- View Can Show The Text That Create it 
-- And Can Encrypt This Text 

-------------------------------------------------------------
-- Stored Procedures: DB Objects
-- Benefits OF SP:
-- 1. Improved Performance 
-- 2. Stronger Securtiy [Hide Meta Data]
-- 3. Reduce Server Network Traffic 
-- 4. Hide Business Rules
-- 5. Handel Errors
-- 6. Accept Input And Output Parameter




Use ITI

Select * From Student

USE ITI

-- Examples Of SP:
-- Get Student By Id

Create Proc SP_GetStudentDataById(@StdId int)
as 
	Select *
	From Student
	Where St_Id = @StdId


SP_GetStudentDataById 1

Execute SP_GetStudentDataById 1
Exec SP_GetStudentDataById 1


Declare @Id int = 5

Execute SP_GetStudentDataById @Id



SP_HelpText 'SP_GetStudentDataById'


Create Or Alter Proc SP_GetStudentDataById(@StdId int)
With Encryption
as 
	Select *
	From Student
	Where St_Id = @StdId


Create Schema HR

Alter Schema HR
Transfer SP_GetStudentDataById

HR.SP_GetStudentDataById 1


-- Insert Based On Execute

-- Insert Based On Select


Create Or Alter Proc SP_GetStudentsByAddress @StdAddress varchar(30)
With Encryption
as
	Select St_Id as id, St_Fname as Name, St_Address as Address
	From Student
	Where St_Address = @StdAddress


	SP_GetStudentsByAddress 'Alex'	
	
	
	SP_GetStudentsByAddress 'Cairo'

Create Table StudentWithAddress
(
	StdId int primary key,
	STdName varchar(max),
	STdAddress varchar(max)
)

Insert Into StudentWithAddress
Exec SP_GetStudentsByAddress 'Cairo'


Select * From StudentWithAddress



--- Error Handling

Delete From Topic
Where Top_Id = 1
-- The DELETE statement conflicted with the REFERENCE constraint "FK_Course_Topic". The conflict occurred in database "ITI", table "dbo.Course", column 'Top_Id'.


-- Try - Catch

Create OR Alter Proc SP_DeleteTopic @TopId int
With Encryption
as
	Delete From Topic
	Where Top_Id = @TopId


	SP_DeleteTopic 1

Create OR Alter Proc SP_DeleteTopic @TopId int
With Encryption
as
	Begin Try
		Delete From Topic
		Where Top_Id = @TopId
	End Try
	Begin Catch 
	-- This Code Will Be Executed When The Query in The Try Block is Failed
		--Select 'U Can Not Delete This Topic ya hamada'
		print 'U Can Not Delete This Topic ya hamada'
	End Catch


	SP_DeleteTopic 1


-- Input And Output Parameter


-- Input Parameter

Create Or Alter Proc SP_SubtractData @X int = 4, @Y int = 1
with Encryption
 as
	Select @X - @Y


SP_SubtractData 2, 1 -- Passing By Order
SP_SubtractData @Y = 2, @X = 1 -- Passing By Name
SP_SubtractData @Y = 3
SP_SubtractData 12



-- Output Parameter
-- Return Value From SP 

Create Or Alter Proc SP_GetStdNameAndAgeById @Id int, @Name varchar(20) output, @Age int output
With Encryption
 as
	Select @Name = St_Fname, @Age =  St_Age
	From Student
	Where St_Id = @Id



	Declare @StdAge int, @StdName varchar(20)

	Exec SP_GetStdNameAndAgeById 2, @StdName output, @StdAge output

	Select @StdAge, @StdName

-- Input Output Parameter

Create Or Alter Proc SP_GetStdNameAndAgeByIdV02 @Data int Output, @Name varchar(20) output
With Encryption
 as
	Select @Name = St_Fname, @Data =  St_Age
	From Student
	Where St_Id = @Data


	Declare @Data int = 1, @StdName varchar(20)
	 Exec SP_GetStdNameAndAgeByIdV02 @Data output, @StdName output

	 Select @Data AS Age, @StdName as Name

-- Function vs View vs SP

--------------------------------------------------------------------
-- Trigger:

-- Types Of SP:
-- 1. User-Defined SP
-- 2. Built-in SP --> SP_HelpText, SP_Rename
-- 3. Special SP --> Trigger
--              -- 1. U Can't Call It
--              -- Take No Parameter

-- Trigger Will Be Executed Or Called When Event Occured 
-- Server Level
-- DB Level
-- Table Level :-->
-- Trigger Will Be Executed With Event Occured On Table Or View
-- 1. Insert 
-- 2. Update
-- 3. Delete

-- Trigger Execute After The Action Or Instead Of The Action



-- Ex01:

Create Or Alter Trigger Tri_Welcome
On Student
After Insert
as
	print 'Welcome To ITI ya handasa'

Insert Into Student(St_Id, St_Fname, St_Address, St_Age)
Values(30,'Ahmed', 'Cairo', 30)




Create Or Alter Trigger Tri_Welcome02
On Student
After Insert
as
	print 'Welcome V02 To ITI ya handasa'


Insert Into Student(St_Id, St_Fname, St_Address, St_Age)
Values(40,'Ahmed', 'Cairo', 30)



Create Or Alter Trigger NotifyOnUpdateStudent
On Student
With Encryption
After Update
as
	Select SUSER_NAME() as UpdateBy, GETDATE() as UpdateOn



Update Student
Set St_Fname = 'Omar'
Where St_Id = 40

Create Or Alter Trigger DisableDeleteStudent
On Student
With Encryption
Instead Of Delete
as	
	print 'U Can not Delete Fron This Table :('


Delete From Student
where St_Id = 30



Create Or Alter Trigger DisableDeleteStudent
On Student
With Encryption
For Delete
as	
	Rollback Transaction
	print 'U Can not Delete Fron This Table :('



-- Prevent Insert, Update, Delete From Table Departments

Create Or Alter Trigger DisableDMLOnDepartment
On Department
With Encryption
Instead Of Delete , Insert, Update
AS
	Print 'U Can not DO Any DML Commands On The Department Table :('

Delete From Department

Update Department
Set Dept_Name = 'SD'
Where Dept_Id = 10



---------------------------------------------------------------------

Drop Trigger DisableDMLOnDepartment


Alter Table Department
Disable Trigger DisableDMLOnDepartment

Alter Table Department
Enable Trigger DisableDMLOnDepartment

Update Department
Set Dept_Name = 'SD'
Where Dept_Id = 10

Disable Trigger DisableDMLOnDepartment
On Department


Enable Trigger DisableDMLOnDepartment
On Department



-- The Most Important Point On Trigger
-- When Fire The Tigger Two Table Will Be Created In Runtime
-- Inserted
-- Deleted

-- Insert : Inserted Table Will Be Contain The Inserted Row 
-- Delete : Deleted Table Will Be Contain The Deleted Row 
-- Update : Inserted Table Will Be Contain The New Row 
--        : Deleted Table Will Be Contain The Old Row


Create Or Alter Trigger AuditOnCourse
On Course
After Update
As
	Select * From deleted
	Select * From inserted

Update Course
SEt Crs_Name = 'C#'
Where Crs_Id = 100


Create Or Alter Trigger DisableDeleteOnTopics
On Topic
With Encryption
Instead of Delete
AS
	Select CONCAT('U Can not Delete topic With Id = '
			, (Select Top_Id From deleted) , ' And Its Name : '
			, (Select Top_Name From deleted))

Delete From Topic
Where Top_Id =	1




Create Or Alter Trigger DisableDeleteOnCourse
On Course
Instead Of Delete
as	
	if (DateName(WEEKDAY, GETDATE()) != 'Tuesday')
		Delete From Course
		Where Crs_Id in (Select Crs_Id From deleted)
	Else
		Select 'U Can not Delete Course on Tuesday'


Delete From Course
Where Crs_Id = 100




