--===================================================================================
----------------------------------- Triggers ----------------------------------------
--===================================================================================
---------------------------------- DML Triggers -------------------------------------
-------------------------------------------------------------------------------------
-- Triggers Fire When event Occurred On Table | View 
-- Event (Not Select Or Truncate - NOT LOGGED In LDF)
-- 1. Insert 
-- 2. Update 
-- 3. Delete 
-------------------------------------------------------------------------------------
-- Welcome Trigger In Table Student 
-------------------------------------------------------------------------------------
Create Or Alter Trigger SayWelcome
On Student 
With Encryption 
After Insert
As
    Print 'Welcome To Route Academy'
Go 
Insert into Student(St_Id , St_Fname , St_Address , St_Age)
Values(20 , 'Aliaa' , 'Cairo' , 30)

-------------------------------------------------------------------------------------
-- Transfer Table To Another Schema
-------------------------------------------------------------------------------------
Alter Schema HR 
Transfer Student
Go

Alter Trigger HR.SayWelcome 
On HR.Student 
With Encryption 
After Insert
As
    Print 'Welcome To Route Academy' 
Go
-------------------------------------------------------------------------------------
-- When An Update On Table Student Occurred Return Time Of Modification And User 
-------------------------------------------------------------------------------------
Create Trigger NotifyOnUpdateStudent
On Student 
With Encryption 
After Update 
As 
   Select SUSER_NAME() [Updatedby] , GETDATE() [UpdatedOn]

   
Update Student
Set St_Fname = 'Shaimaa'
Where St_Id = 20

Go 

-------------------------------------------------------------------------------------
-- Prevent Delete From Table Student  
-------------------------------------------------------------------------------------
Create Trigger DisableDeleteOnStudent
On Student 
With Encryption 
Instead Of Delete 
As
   Print 'You Can''t Delete From This Table' 

Delete From Student
Where St_Id = 20

Go 
Create Or Alter Trigger DisableDeleteOnStudent
On Student 
With Encryption 
For Delete 
As
  Rollback Transaction
  Print 'You Can''t Delete From This Table' 
Go

Create Or Alter Trigger DisableDeleteOnStudent
On Student 
With Encryption 
Instead Of Delete 
As
   RaisError( 'You Can''t Delete From This Table' , 15 , 1 ) 

Delete From Student
Where St_Id = 19

go
Create Or Alter Trigger DisableDeleteOnStudent
On Student 
With Encryption 
Instead Of Delete 
As
   RaisError( 'You Can''t Delete From This Table' , 20 , 1 ) With Log



-------------------------------------------------------------------------------------
-- Prevent Insert , Update , Delete From Department   
-------------------------------------------------------------------------------------
Go 
Create Trigger DisableDMLOnDepartmentTable
On Department 
With Encryption 
Instead Of Delete , Insert , Update 
As
   Print 'You Can''t Do Any DML Commands In Department Table'


 Delete From Department
 Where Dept_Id = 10
 
 Update Department
 Set Dept_Name = 'HR'
 Where Dept_Id = 10
	

-------------------------------------------------------------------------------------
-- Drop Or Disable Trigger 
-------------------------------------------------------------------------------------
 DROP TRIGGER DisableDMLOnDepartmentTable

Alter Table Department
Disable Trigger DisableDMLOnDepartmentTable
go

DISABLE TRIGGER DisableDMLOnDepartmentTable 
ON Department 

IF OBJECT_ID ('DisableDMLOnDepartmentTable') IS NOT NULL  
   DROP TRIGGER DisableDMLOnDepartmentTable 

Alter Table Department
Enable Trigger DisableDMLOnDepartmentTable

-------------------------------------------------------------------------------------
------------------------ Inserted And Deleted Tables  -------------------------------
-------------------------------------------------------------------------------------
-- Audit Update On Table Course
-------------------------------------------------------------------------------------
Go
Create Or Alter Trigger AuditOnCourses
On Course 
With Encryption 
After Update
As
   Select * From deleted
   Select * From inserted


Update Course
Set Crs_Name = 'C#'
Where Crs_Id = 100

-------------------------------------------------------------------------------------
-- Prevent Delete On Table Topic 
-- And Display Message For User That He/She Can Not Delete This Topic
-- Message =>  'You Can''t Delete Topic With Id = {} And Name = {}'
-------------------------------------------------------------------------------------
Go
Create OR Alter Trigger DisableDeleteTopic
On Topic 
With encryption 
Instead Of Delete 
As
    Select CONCAT_WS (' ' , 'You Can''t Delete Topic With Id ='
	                  ,(Select Top_Id From deleted) , 
	                  'And Name =' , (Select Top_Name From deleted)) 
Delete From Topic 
Where Top_Id = 1


-------------------------------------------------------------------------------------
-- Prevent Delete From Table Course if Day is Sunday
-------------------------------------------------------------------------------------
Go
Create Or Alter Trigger DisableDeleteOnCourse
On Course 
With Encryption 
Instead Of Delete 
As
   If (DATENAME(WEEKDAY , GETDATE()) != 'Sunday')  
       Delete From Course
	   Where Crs_Id in (Select Crs_Id From deleted)
  Else
    Select 'You Can''t Delete Course on Sunday'


Delete From Course
Where Crs_Id = 1200
go

Create Or Alter Trigger DisableDeleteOnCourse
On Course 
With Encryption 
After  Delete 
As
   If (DATENAME(WEEKDAY , GETDATE()) = 'Sunday')
	   rollback
       Select 'You Can''t Delete Course on Sunday'
	  


-------------------------------------------------------------------------------------
---------------------------------- DDL Triggers -------------------------------------
-------------------------------------------------------------------------------------
-- Database -- Server Scope
-- Events [Create - Alter - Drop]
-------------------------------------------------------------------------------------
-- Database Created Successfully After Creation
-------------------------------------------------------------------------------------
Go
Create Trigger NotifyOnDatabaseCreation
On ALL SERVER 
With Encryption 
For CREATE_DATABASE 
As 
  Begin
    Print 'Database Created Successfully'
  End 
Go 

Create Database Testt

-------------------------------------------------------------------------------------
-- Prevent Database Creation For All Members Except db_Owner
-------------------------------------------------------------------------------------
Go
Create OR Alter Trigger DisableDatabaseCreation 
On ALL Server 
With Encryption 
For CREATE_DATABASE 
AS
    IF IS_MEMBER('db_Owner') = 0
	   BEGIN 
	      Print 'You are''t The Owner , Go Out'
	      ROLLBACK Transaction
	   END

Create Database Test03

----------------------------------------------------------------------------------
-- Database Object (Table , Function , View ...) -- Database Scope
-- Events [Create - Alter - Drop]
----------------------------------------------------------------------------------
-- Table Created Successfully After Creation
-------------------------------------------------------------------------------------
Go 
Create Or Alter Trigger NotifyOnTableCreation 
On Database 
With Encryption 
For CREATE_TABLE 
AS
   Print 'Table Is Created Successfully'


   Create Table NewTable
   (id int Primary key ,
   Test varchar(20))

 Go
----------------------------------------------------------------------------------
-- Modified Successfully After Any Modification On Table
-------------------------------------------------------------------------------------
Create Or Alter Trigger NotifyOnTable
On Database 
With Encryption 
For DDL_Table_EVENTS 
AS
   Print 'Modified Successfully'

   Alter Table NewTable 
   Drop Column Test

    
----------------------------------------------------------------------------------
-- EventData After Any Modification On Table
-------------------------------------------------------------------------------------
Go
Create Or Alter Trigger NotifyOnTable
On Database 
With Encryption 
For DDL_Table_EVENTS 
AS
   Select EVENTDATA()

   Create Table NewTable02
   (id int )

----------------------------------------------------------------------------------
-- Disable Alter On Tables
-------------------------------------------------------------------------------------
Go
Create Or Alter Trigger DisableAlter 
On Database 
With Encryption 
For ALTER_TABLE
As
   Begin 
    Print 'You Can''t Do This Modification' 
	Rollback
   End

Alter Table NewTable
Drop Constraint [PK__NewTable__3213E83F2D05D276]


-------------------------------------------------------------------------------------
---------------------------------- LOGON Triggers -------------------------------------
-------------------------------------------------------------------------------------
Go
CREATE OR Alter TRIGGER connection_limit_trigger ON ALL SERVER
WITH EXECUTE AS N'Salma'
FOR LOGON AS 
BEGIN
    DECLARE @session_count INT

    SELECT @session_count = COUNT(*)
    FROM sys.dm_exec_sessions
    WHERE is_user_process = 1
      AND original_login_name = N'Salma'

    IF ORIGINAL_LOGIN() = N'Salma' AND @session_count > 2
    BEGIN
        ROLLBACK
    END
END




