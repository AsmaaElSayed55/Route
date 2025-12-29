--=================================================================
---------------------------- Index --------------------------------
--=================================================================
 -- Clustered Index on St_Fname In Table student 
 ------------------------------------------------------------------
 Create Clustered Index Ix_Fname 
 On Student (St_Fname)
 -- Cannot create more than one clustered index on table Student

 Create NonClustered Index Ix_Fname -- Non-Unique , NonClustered Index
 On Student (St_Fname)

 Select *
 From Student
 Where St_Fname = 'Ahmed' -- Faster Search 

 ------------------------------------------------------------------
 -- New Table With Primary Key and Unique Key Constraints
 ------------------------------------------------------------------
 Create Table TestTable 
 (X int Primary Key , 
  Y int Unique ,
  Z int Unique )

 ------------------------------------------------------------------
 -- Unique Index on St_age In Table student 
 ------------------------------------------------------------------
 
 Create Unique Index Ix_Age
 On Student(St_age)
--  Make Unique Non-Clustered Index on Column
 
 Create Unique Clustered Index Ix_Age
 On Student(St_age)
--  Make Unique Clustered Index on Column

 Create Index Ix_Age02
 On Student(St_age)
 --  Make Non-Unique Non-Clustered Index on Column

 Select * From Student
 Where St_Id = 1

--=================================================================
------------------------ Indexed View -----------------------------
--=================================================================
Go
Create View StudentDepartmentViews
With Encryption 
As
   Select S.St_Id , S.St_Fname , D.Dept_Id , D.Dept_Name
   From Department D inner Join Student S 
   On D.Dept_Id = S.Dept_Id

Go 
Create OR Alter View StudentDepartmentViews
With Encryption , SchemaBinding
As
   Select S.St_Id , S.St_Fname , D.Dept_Id , D.Dept_Name
   From dbo.Department D inner Join dbo.Student S 
   On D.Dept_Id = S.Dept_Id
go



   Create Index Ix_Test 
   On StudentDepartmentViews([St_Id])
-- Cannot create index on view 'StudentDepartmentViews'. 
-- It does not have a unique clustered index.

   Create unique Clustered Index Ix_Test 
   On StudentDepartmentViews([St_Id])

   Create Index Ix_Test02 
   On StudentDepartmentViews([St_Id])


--=================================================================
----------------------------- TCL ---------------------------------
--=================================================================
-- Implicit transactions

Insert into Student(St_id ,St_Fname)
Values(100 ,'Aliaa') -- Implicit transaction

Update Student
Set St_Fname = 'Mona'
Where St_Id = 100 --Implicit transaction

-- Explicit transactions
-- Set of Implicit transactions 

Begin Transaction 
--Set of Implicit transactions 
Commit Transaction | Rollback Transaction

Create Table Parent 
(id int Primary Key)

Insert into Parent
Values(1),(2),(3)

Create Table Child
(id int Primary Key , 
Parent_Id int References Parent(id))


Insert into Child
Values(1,1),(2,200),(3,3) -- Error


Insert into Child Values(1,1)
Insert into Child Values(2,200) -- Error
Insert into Child Values(3,3)   

Begin Tran 
Insert into Child Values(1,1)
Insert into Child Values(2,200) 
Insert into Child Values(3,3)   
Commit Tran


Begin Tran 
Insert into Child Values(4,1)
Insert into Child Values(5,200) 
Insert into Child Values(6,3)   
rollback Tran



Begin Try 
    Begin Tran 
       Insert into Child Values(1,1) -- Request An OTP To Tran
       Insert into Child Values(2,2) -- Send OTP To My Mobile 
       Insert into Child Values(3,3) -- Enter Number And OTP At ATM
	   Save Tran Tran01
       Insert into Child Values(4,100) -- Cash Withdrawal From ATM
       Insert into Child Values(5,3) -- Withdrawal from the account
	Commit Tran
End Try 
Begin Catch 
    Rollback Tran Tran01
End Catch 

Select * From Child

Delete From Child

--=================================================================
----------------------------- DCL ---------------------------------
--=================================================================-------------------------------------------------------------------
-- Create Login 
-------------------------------------------------------------------
Go
CREATE LOGIN SalmaLogin
WITH PASSWORD = 'Salma123'
Go
-------------------------------------------------------------------
-- Create User For Login 
-------------------------------------------------------------------
CREATE USER SalmaUser
FOR LOGIN SalmaLogin

-------------------------------------------------------------------
-- Give User Access To Table Course , Topic , Stud_Course
-------------------------------------------------------------------
Go
Create Schema Crs 

Alter Schema Crs 
Transfer Stud_Course 
 
GRANT SELECT 
ON  crs.Stud_Course  
TO SalmaUser

Deny Insert 
ON  crs.Stud_Course  
TO SalmaUser

Revoke SELECT 
ON crs.Stud_Course  
From SalmaUser
