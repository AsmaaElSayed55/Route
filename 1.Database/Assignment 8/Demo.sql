--------- Asmaa El Sayed ----------
------------- Demo Session 8 -----------------


--------------------------- Functions -----------------------------
--=================================================================

-- Functions : DB objects 
--			 : Block Of Query 

----------- User Defined Functions ----------------
-- 1. Scaler Function : Return Just Only One Value 
-- 2. Table-Valued Functions : Return Table
	-- 2.1. Inline Table-Valued Functions          ( Return Table )
	-- 2.2. Multistatments Table-Valued Functions  ( Return Table )

-- NOTE 
-- Functions In DB Must Return A Value
-- Functions May Take Parameters Or Not

-- Any Function Contains Of 2 : 
-- 1. Signature (Name, Parameters, Return Type)
-- 2. Body (Code ' Query' )  [ Select Statments , Insert Based On Select ]




----------- 1. Scaler Functions ----------------

Go
Create Function GetStudentNameByStId (@Std_Id int) -- Signature
Returns Varchar(50)  -- Return Type
Begin
	-- Code
	Declare @St_Name Varchar(50) 
	Select @St_Name = St_Fname + ' ' + St_Lname
	From Student
	Where St_Id =@Std_Id

	return @St_Name
End
Go -- 


-- Call Function 
Select dbo.GetStudentNameByStId(1)
Select dbo.GetStudentNameByStId(2)
Select dbo.GetStudentNameByStId('3') -- Valid  -> It Can cast It To Int

---------------------------------------

Go
Create Function GetManagerByDeptName (@DeptName Varchar(50)) -- Signature
Returns Varchar(50)  -- Return Type
Begin
	-- Code
	Declare @Manager_Name Varchar(50) 
	Select @Manager_Name = I.Ins_Name
	From Department D, Instructor I
	Where D.Dept_Id = I.Dept_Id and D.Dept_Name =@DeptName

	return @Manager_Name
End
Go -- 


-- Call Function
Select dbo.GetManagerByDeptName('SD')
Select dbo.GetManagerByDeptName('EL')



----------- 2. Table-Valued Functions ----------------
--------- 2.1 Inline Table-valued Functions ----------
-- Return Table [One Select]

Go
Create Function GetAllInstructorsByDeptId (@DeptId int) -- Signature
Returns Table  -- Return Type
As Return (
	-- Code
	Select Ins_Id , Ins_Name , Dept_Id
	From Instructor
	Where Dept_Id = @DeptId
		)
Go -- 


-- Call Function
Select * 
From dbo.GetAllInstructorsByDeptId(30)

Select * 
From dbo.GetAllInstructorsByDeptId(20)


--------- 2.2 Multistatment Table-valued Functions ----------


Go
Create Function GetStudentNameBasedOnFormat(@Format Varchar(50)) -- Signature
Returns @T Table (StuId int , StuName Varchar(50))  -- Return Type
As 
Begin
	If @Format = 'first'
		Insert Into @T
		Select St_Id , St_Fname  
		From Student
	Else If @Format = 'last'
		Insert Into @T
		Select St_Id , St_Lname  
		From Student
	Else If @Format = 'full'
		Insert Into @T
		Select St_Id , St_Fname+' '+St_Lname 
		From Student

	Return 
End
Go -- 


-- Call Function
Select * 
From GetStudentNameBasedOnFormat('first')

Select * 
From GetStudentNameBasedOnFormat('second')

Select * 
From GetStudentNameBasedOnFormat('full')



----------------------------- Views -------------------------------
--=================================================================
 
-- Views : DB Objects
-- Block Of Query 
-- Saved Query As Virtual Table
-- 1. Simplfy Query 
-- 2. Hidding Metadata [ Columns, Tables ] ' Important for Security of Database'
-- 3. Abstract The Logic

Go

Create View V_StudentData
As
 Select St_Id, St_Fname, St_Age
 From Student 
 
Go

-- Call 'Use' View 
Select * 
From V_StudentData

--------------------

Go

Create View V_StudentDataBasedOnDepartment
As
 Select S.St_Fname, D.Dept_Name, S.St_Address
 From Student S , Department D 
 Where D.Dept_Id = S.Dept_Id and S.St_Address ='Cairo'
 
Go

-- Call 'Use' View 
Select * 
From V_StudentDataBasedOnDepartment



--------------- 1. Standard View ------------------

Go
Create View V_CairoStudent
As
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address ='Cairo'

Go

Select *
From V_CairoStudent

--------------- Alter on View ------------------

Go
Alter View V_CairoStudent
As
	Select St_Id, St_Fname, St_Address, St_Age
	From Student
	Where St_Address ='Cairo'

Go

Select *
From V_CairoStudent

Go

-- To Avoid Any Error If View Is Exist

Create or Alter View V_CairoStudent
As
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address ='Cairo'

Go

Select *
From V_CairoStudent

---------------------------------

-- Work With Any DB Object
SP_HelpText 'V_CairoStudent' -- Show The Query That Created this DB Object

Go
Create or Alter View V_AlexStudent
With Encryption
As
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address ='Alex'

Go

Select *
From V_AlexStudent

SP_HelpText 'V_AlexStudent' -- Show The Query That Created this DB Object
-- If This DB Object Was With Encryption --> It Will Show The text for object 'DB Object Name' is encrypted.

-------------- With Ails Name For Coulmns

Go
Create or Alter View V_AlexStudent(StudentId, StudentName,StudentAddress)
With Encryption
As
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address ='Alex'

Go

Select *
From V_AlexStudent

SP_HelpText 'V_AlexStudent' -- It Will Show The text for object 'DB Object Name' is encrypted.

--------------- 2. Partitioned View ------------------

Go

Create Or Alter View V_CairoOrAlexStudents 
With Encryption
As
	Select * From V_CairoStudent
	Union All
	Select * From V_AlexStudent

Go

Select St_Id
From V_CairoOrAlexStudents



--------------- View + DML ------------------

-- View + DML ( Insert - Update - Delete )

Select * From V_CairoStudent

--------------------- Insert 

Insert Into V_CairoStudent Values(30,'Amr','Fayoum') -- This Data Inserted in Student Table
 
Go
Create Or Alter View V_StudentNameWithAge
As
	Select St_Fname, St_Age
	From Student

Go

Select * From V_StudentNameWithAge


Insert Into V_StudentNameWithAge Values('Khaled',40) -- Invalid Because It Should Follow Constraint ' PK Not Allow Null '

Select * From V_StudentDataBasedOnDepartment


Go
Create Or Alter View V_StudentInDepartment
As
	Select St_Id, St_Fname,D.Dept_Id,Dept_Name
	From Student S, Department D
	Where S.Dept_Id=D.Dept_Id
Go

-- Invalid Because Not Allow affect multiple base tables.
Insert Into V_StudentInDepartment Values(50,'Ali',90,'HR')



Insert Into V_StudentInDepartment(St_Id,St_Fname) Values(50,'Ali')

Insert Into V_StudentInDepartment(Dept_Id,Dept_Name) Values(90,'HR')

Select * From V_StudentInDepartment



--------------------- Update
Select * From V_CairoStudent

Update V_CairoStudent
Set St_Fname='Omar'
where St_Id=2

--------------------- Delete

Delete From V_CairoStudent
Where St_Id=30

--------------- View With Check Option ------------------
Select * From V_CairoStudent

Insert Into V_CairoStudent Values(60,'Amr','Cairo')

-- If You Want Not Done By This View 
Insert Into V_CairoStudent Values(80,'Mona','Alex')  -- It Will Be Added But Not Show In V_CairoStudent view

Select * From V_AlexStudent


-- Do This 
Go
Create or Alter View V_CairoStudent
As
	Select St_Id, St_Fname, St_Address
	From Student
	Where St_Address ='Cairo' With Check Option

Go

Insert Into V_CairoStudent Values(80,'Mona','Alex')  -- Give Error

Update V_CairoStudent
Set St_Address='Alex' -- Give Error
Where St_Id=2