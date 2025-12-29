--=================================================================
---------------------------- Views --------------------------------
--=================================================================
-- 1. Basic User-Defined Views [Standard View]
-------------------------------------------------------------------
-- Students In Cairo
-------------------------------------------------------------------
Create View VCairoStudents
As
    Select St_Id , St_Fname , St_Address
	From Student
	Where St_Address = 'Cairo'

Select * From VCairoStudents

-------------------------------------------------------------------
-- Students In Alex
-------------------------------------------------------------------
Create Or ALTER View VAlexStudents
As
    Select St_Id , St_Fname , St_Address
	From Student
	Where St_Address = 'Alex'

Alter View VAlexStudents
As
    Select St_Id , St_Fname , St_Address
	From Student
	Where St_Address = 'Alex'
	Order by St_Fname -- Invalid 
-- The ORDER BY clause is invalid in views unless TOP Is  also specified.

Alter View VAlexStudents
As
    Select TOP(2) St_Id , St_Fname , St_Address
	From Student
	Where St_Address = 'Alex'
	Order by St_Fname
Select St_Id , St_fname From VAlexStudents

-------------------------------------------------------------------
-- Students And Their Departments
-------------------------------------------------------------------
Create View VStudentsInDepartment
As 
  Select S.St_Id , S.St_Fname , D.Dept_Id , D.Dept_Name
  From Student S inner join Department D
  On D.Dept_Id = S.Dept_Id 


Select * from VStudentsInDepartment
Where Dept_Id = 10


-------------------------------------------------------------------
-- Transfer View To Another Schema
-------------------------------------------------------------------
 GO
Create Schema HR
GO
Alter Schema HR 
Transfer VStudentsInDepartment

Select * from HR.VStudentsInDepartment
Where Dept_Id = 10


-------------------------------------------------------------------
-- Hide Source Code Of View 
-------------------------------------------------------------------

Sp_HelpText 'HR.VStudentsInDepartment'


Create Or Alter View HR.VStudentsInDepartment
With Encryption
As 
  Select S.St_Id , S.St_Fname , D.Dept_Id , D.Dept_Name
  From Student S inner join Department D
  On D.Dept_Id = S.Dept_Id

Sp_HelpText 'HR.VStudentsInDepartment'
-- The text for object 'HR.VStudentsInDepartment' is encrypted.


-------------------------------------------------------------------
-- Hide Meta Data Of View 
-------------------------------------------------------------------

Create Or Alter View HR.VStudentsInDepartment(StudentId , StudentName , DepartmentId , DepartmentName)
With Encryption
As 
  Select S.St_Id , S.St_Fname , D.Dept_Id , D.Dept_Name
  From Student S inner join Department D
  On D.Dept_Id = S.Dept_Id

  Select * From HR.VStudentsInDepartment


-------------------------------------------------------------------
-- Student , Course And Their Grades 
-------------------------------------------------------------------

Create OR Alter View VStudentsGrades(StudentName , CourseName , StudentGrade , DepartmentId)
With Encryption 
As
    Select St_Fname , Crs_Name , Grade , std.Dept_Id
	From Student std , Stud_Course StdCrs , Course Crs
	Where Std.St_Id = StdCrs.St_Id And Crs.Crs_Id = StdCrs.Crs_Id

Select * from VStudentsGrades
Where DepartmentId = 10 


-------------------------------------------------------------------
-- 2. Partitioned Views
-------------------------------------------------------------------
GO
Create OR ALter View CairoAlexStudents
With Encryption
As
   Select St_Id , St_Fname , St_Address From Student Where St_Address = 'Cairo'
   Union All
   Select St_Id , St_Fname , St_Address From Student Where St_Address = 'Alex'
GO
Create Or Alter  View CairoAlexStudents
With Encryption
As
   Select * From VCairoStudents
   Union All 
   Select * From VAlexStudents
GO

Select * From CairoAlexStudents

--=================================================================
----------------------- Views With DMl ----------------------------
--=================================================================
-- Using Insert , Update and Delete Through View
-------------------------------------------------------------------
-- Insert 
Insert into VCairoStudents
Values(20 ,'Mohamed' ,'Cairo')

Create Or Alter View StudentsAge 
As 
 Select St_Fname , St_Age
 From Student

 Insert into StudentsAge 
 Values('ali' , 25) -- Invalid

 Insert into HR.VStudentsInDepartment
 Values(30,'Mona', 10 , 'SD')
 -- not updatable because the modification affects multiple base tables.

 Insert into HR.VStudentsInDepartment(StudentId , StudentName)
 Values(30,'Mona') -- Valid
 
 Insert into HR.VStudentsInDepartment(DepartmentId , DepartmentName)
 Values(80,'HR') -- Valid


 -- Update 
Select * From VCairoStudents

 Update VCairoStudents
 set St_Fname ='Omar'
 Where St_Id = 2


 Select * From HR.VStudentsInDepartment

 Update HR.VStudentsInDepartment
 Set StudentName = 'Samy' 
 Where StudentId = 5


  Update HR.VStudentsInDepartment
 Set StudentName = 'Samy' , DepartmentName = 'HR'
 Where StudentId = 5
 -- not updatable because the modification affects multiple base tables.


-- Delete 

Select * From VCairoStudents

Delete From VCairoStudents
Where St_Id = 20


Select * From HR.VStudentsInDepartment

Delete From HR.VStudentsInDepartment
Where StudentId = 1
-- not updatable because the modification affects multiple base tables.



--=================================================================
-------------------- Views With Check Option ----------------------
--=================================================================
Insert into VCairoStudents
Values(40 ,'Aliaa' , 'Alex')

Update VCairoStudents
Set St_Fname = 'Samar'
Where st_Id = 40

Delete From VCairoStudents
Where St_Id = 40

Create Or alter  View VCairoStudents
With Encryption
As
    Select St_Id , St_Fname , St_Address
	From Student
	Where St_Address = 'Cairo' 	With Check Option

Insert into VCairoStudents
Values(50 ,'Aliaa' , 'Alex') -- Invalid

--=================================================================
------------------------ Stored procedures ------------------------
--=================================================================
-- Get Stduent by Id 
--------------------------------------------------------------------
Create Proc SPGetStudentById (@Stdid int)
As
   Select *
   From Student
   Where St_Id = @Stdid


 SPGetStudentById 1
 Execute  SPGetStudentById 1
 Exec  SPGetStudentById 1

 Declare @StdId int = 5
 Exec  SPGetStudentById @Stdid
 -- For Display Only 


	
--------------------------------------------------------------------
-- Alter Stored procedure
--------------------------------------------------------------------
Create OR Alter Proc SPGetStudentById @Stdid int
With Encryption
As
   SET NOCOUNT OFF -- Default
   -- Controls whether a message that shows the number of rows affected by a Transact-SQL statement or stored procedure is returned after the result set
   Select St_Id [id] , St_Fname [Name] , St_Age [Age]
   From Student
   Where St_Id = @Stdid


 Exec  SPGetStudentById 1

--------------------------------------------------------------------
-- Transfer Stored procedure To Another Schema
--------------------------------------------------------------------

Alter Schema HR
Transfer SPGetStudentById

 Exec HR.SPGetStudentById 1
 

--=================================================================
---------------------- Insert Based On Execute --------------------
--=================================================================

Create Proc SpGetStudentByAddress @StdAddress Varchar(20)
With Encryption 
as
   Select St_Id [id], St_Fname [Name] , St_Address [Address]
   From Student
   Where St_Address = @StdAddress


Create Table StudentsWithAddress
(
StdId int Primary key ,
StdName Varchar(Max),
StdAddress Varchar(Max)
)

Insert Into StudentsWithAddress
Exec SpGetStudentByAddress 'Alex'
where Std_Id = 10 -- Invalid 

Select *
From  StudentsWithAddress

--=================================================================
-------------------- Stored procedure Examples --------------------
--=================================================================
-- Error Handling 
-------------------------------------------------------------------
Delete From Topic 
Where Top_Id = 1
-- The DELETE statement conflicted with the REFERENCE constraint "FK_Course_Topic". 
-- The conflict occurred in database "ITI", table "dbo.Course", column 'Top_Id'.

Create Or Alter Proc SpDeleteTopicbyId @TopId int 
With Encryption 
as
      Delete From Topic 
      Where Top_Id = @TopId



Create Or Alter Proc SpDeleteTopicbyId @TopId int 
With Encryption 
as
  Set NOCOUNT ON
   Begin Try 
      Delete From Topic 
      Where Top_Id = @TopId
   End Try 
   Begin Catch
    --Print ERROR_MESSAGE() -- The DELETE statement conflicted with the REFERENCE constraint "FK_Course_Topic". The conflict occurred in database "ITI", table "dbo.Course", column 'Top_Id'.
    --Print ERROR_NUMBER() -- 547
     Select  /*Print*/ 'You Can not Delete This Topic'
   End Catch

SpDeleteTopicbyId 1 

-------------------------------------------------------------------
-- Input Parameter  
-------------------------------------------------------------------

Create Or Alter Proc SPSubtarctData @X int = 4 , @Y varchar(10) = '1'
With Encryption 
As
    Select @X - @Y


SPSubtarctData 4 , '2' -- Passing in Order 
SPSubtarctData @Y = '2' , @X = 4 -- Passing By Name 
SPSubtarctData   -- Using Default Values 
SPSubtarctData 5
SPSubtarctData @Y = '3'

-------------------------------------------------------------------
-- Output Parameter  
-------------------------------------------------------------------
-- Return Of Stored Procedure 

Create Proc SpGetStdNameAndAgebyId @id int , @Name varchar(20) Output, @Age int output
With Encryption 
as
   Select @Name = St_Fname , @Age = St_Age
   From Student
   Where St_Id = @id


   Declare @StdAge int , @StdName Varchar(20)
   Exec SpGetStdNameAndAgebyId 1 , @StdName Output , @StdAge output
   Select @StdAge + 10 [Age]  , @StdName + 'Test' [Name]

-------------------------------------------------------------------
-- Input Output Parameter  
-------------------------------------------------------------------

Create Proc SpGetStdNameAndAgebyIdV02 @Data int output, @Name varchar(20) Output
With Encryption 
as
   Select @Name = St_Fname , @Data = St_Age
   From Student
   Where St_Id = @Data


    Declare @Data int = 1, @StdName Varchar(20)
   Exec SpGetStdNameAndAgebyIdV02 @Data output, @StdName Output 
   Select  @StdName [Name], @Data [Age]


