 -- SQL : Structure Query Language
 -- 1. Varaibles
 -- 1.1. Global Varaibles  : Start @@
 -- 1.2. Local Varaibles   : Start @
 ----------------------------------------------
 -- 2. Datatypes 
 ------------------------------------------------
 -- 3. SQL Categories
 -- 3.1. DDL : Data Definitation Langauge
 -- 3.2. DML : Data Manupulation Language
 -- 3.3. DQL : Data Query Language
 -- 3.4. DCL : Data Control Language
 -- 3.5. TCL : Trasction Control Language

 --------------------------------------------------------
 -- DDL: Structure (Create - Alter - Drop)
 -- 1. Create : To Create Database Or Any DB Objects (Table, Functions, Views, SP, ......)
 -- 2. Alter : To Update Database Or Any DB Objects (Table, Functions, Views, SP, ......)
 -- 2. Drop : To Delete Database Or Any DB Objects (Table, Functions, Views, SP, ......)

 -- DDL Using SQL
 -- DDL Using Wizard 

 ---------------------------------------------------------------------------

 -- DML : Data Manipulation Language - Data
 -- (Insert - Update - Delete)

 -- 1. Insert : Insert Row Or More Into Any Table
 -- 1.1. Simple Insert  : Insert Just Only One Row

 USE CompanyG02

 Insert Into Employees Values(10 ,'Ali', 'Ahmed', 'M', '10/29/1990', NULL)

 Insert Into Employees Values('Mohamed', 'Gamal', 'M', '10/29/1990', NULL, 1)

 Insert Into Employees(LName, FName) Values('Ahmed', 'Mariam')


 -- 1.2. Row Constructor Insert : Insert More Than One Row 

 Insert Into Employees Values
 ('Omar', 'Khaled', 'M', '10/29/1990', NULL, NULL),
 ('Ahmed', 'Khaled', 'M', '10/29/1990', NULL, NULL),
 ('Maha', 'Ahmed', 'F', '10/29/1990', NULL, NULL)


 Insert Into Departments 
 Values 
 ('HR', 1, '10/15/2021'),
 ('PR', 2, '10/15/2021'),
 ('IT', 3, '10/15/2021')

 Insert Into Employees(FName, Gender) Values('Maha', 'F')

 -- 1. Has Identity
 -- 2. Has Default Value
 -- 3. Allow Null As Valid Value


 Insert Into Employees Values('Amr', 'Mohamed', 'M', '10/29/1990', 50, 1) -- Invalid
 Insert Into Employees Values('Amr', 'Mohamed', 'M', '10/29/1990', 30, 1) -- Valid


 ----------------------------------------------------------

 -- Update : Update Row Or More

 Update Employees
 Set Gender = 'F'
 where SSN = 3


 Update Employees
 Set DNum = 10

 Update Employees
 Set DNum = 20
 Where SSN = 30


 Update Employees
 Set DNum = 30
 Where SSN = 12


 -- Delete : Delete Row Or More


 Delete From Employees
 Where SSN = 8


 Delete From Departments
 Where DNum = 20



 Update Employees
 Set DNum = 30 
 Where DNum = 20


 -------------------------------------------------------------------------

 -- DQL : Data Query Language : Display (Select)


 Select FName, LName From Employees


 Select FName as FirstName, LName, Gender
 From Employees


 Select FName + ' ' + LName as FullName
 From Employees


  Select FName + ' ' + LName as [Full Name]
 From Employees


  Select FName + ' ' + LName as 'Full Name'
 From Employees


 Select [Full Name] = FName + ' ' + LName
 From Employees


 Select *
 From Employees




 USE ITI

 Select *
 From Student


 Select ST_ID, St_Fname, St_Lname, St_Age
 From Student



 
 Select ST_ID, St_Fname, St_Lname, St_Age
 From Student
 Where St_Id = 1

 Select St_Id, St_Fname, St_Age
 From Student
 Where St_Age > 23



 Select St_Id, St_Fname, St_Age
 From Student
 Where St_Age >= 23 And St_Age <= 30

 Select St_Id, St_Fname, St_Age
 From Student
 Where St_Age between 23 And 30


  Select St_Id, St_Fname, St_Age
 From Student
 Where St_Age Not between 23 And 30

 Select St_Id, St_Fname, St_Address
 From Student
 Where St_Address = 'Cairo'


 Select St_Id, St_Fname, St_Address
 From Student
 Where St_Address = 'Cairo' Or St_Address = 'Alex'



 Select St_Id, St_Fname, St_Address
 From Student
 Where St_Address in ('Cairo', 'Alex')


  Select St_Id, St_Fname, St_Address
 From Student
 Where St_Address Not in ('Cairo', 'Alex')


 Select St_Id, St_Fname, St_super
 From Student
 Where St_super = NULL -- Invalid


 -- = Values
 -- NOTE :Null is not Value
 
  Select St_Id, St_Fname, St_super
 From Student
 Where St_super is NULL


   Select St_Id, St_Fname, St_super
 From Student
 Where St_super is Not NULL


 Select *
 From Student
 Where St_Address = 'CAiro'



 ---------------------------------------------------------------------------------------

 -- LIKE - Pattern

 Select St_Id, St_Fname
 From Student
 Where St_Fname like 'a%'

 /*
	Wildcard => 
	% => represent Zero Or More Character
	_ => represent One Character
	[] => Match Any Single Character Within The Range
	[^] => Match Any Single Character not Within The Range
 */

  Select St_Id, St_Fname
 From Student
 Where St_Fname  like '__a%'


 Select St_Id, St_Fname
 From Student
 Where St_Fname  like '[^sa]%'



 Select St_Id, St_Fname
 From Student
 Where St_Fname  like '%[%]'

 

 Select St_Id, St_Fname
 From Student
 Where St_Fname  like '%a'

 ---------------------------------------------------------------------

 -- Distinct Used To Display Data Without Any Duplication


 Select Distinct St_Address
 From Student
 Where St_Address is not null

 ----------------------------------------------------------------------------

 -- Order By
 -- Sorting [Ascending, Descending]

 Select *
 From Student


 Select *
 From Student 
 Order By St_Age asc -- Default


 
 Select *
 From Student 
 Order By St_Age desc


 Select St_Id, St_Fname, St_Lname, St_Age
 From Student
 order by St_Fname


  Select St_Id, St_Fname, St_Lname, St_Age
 From Student
 order by St_Fname , St_Lname desc



 
  Select St_Id, St_Fname, St_Lname, St_Age
 From Student
 order by 3

 -----------------------------------------------------------------

 -- Joins:
 -- 1. Cross Joins (Cartisian Product)
 -- 2. Inner Joins
 -- 3. Outer Joins
 -- 4. Self Joins


 -------------------------------------------

 -- 1. Cross Joins (Cartesian Product)

 -- OLD - ANSI
 Select S.St_Fname, D.Dept_Name
 From Student S, Department D

 -- NEW - MS
 Select S.St_Fname, D.Dept_Name
 From Student S cross join Department D


 ---------------------------

 -- 2. Inner Joins (Equi Join)

 -- OLD - ANSI
 Select S.St_Id, S.St_Fname, D.Dept_Name
 From Student S, Department D
 Where S.Dept_Id = D.Dept_Id -- FK = PK


  Select S.St_Id, S.St_Fname, D.Dept_Name
 From Student S join Department D
 On S.Dept_Id = D.Dept_Id -- FK = PK

   Select S.St_Id, S.St_Fname, D.Dept_Name
 From Student S inner join Department D
 On S.Dept_Id = D.Dept_Id -- FK = PK


 -------------------------------------------

 -- 3. Outer Join
 -- 3.1. Left Outer Join
 Select S.St_Id , S.St_Fname, D.Dept_Name
 From Student S left join Department D
 On D.Dept_Id = S.Dept_Id -- PK = FK


 -- 3.2. Right Outer Join
  Select S.St_Id , S.St_Fname, D.Dept_Name
 From Student S right join Department D
 On D.Dept_Id = S.Dept_Id -- PK = FK


 -- 3.3. Full Outer Join
   Select S.St_Id , S.St_Fname, D.Dept_Name
 From Student S full join Department D
 On D.Dept_Id = S.Dept_Id -- PK = FK



 ------------------------------------------------

 -- 4. Self Join - Self Relationship

 Select Stud.St_Fname + ' ' + Stud.St_Lname as [StudentName], Super.St_Fname + ' ' + Super.St_Lname
 From Student Stud, Student Super
 Where Super.St_Id = Stud.St_super -- PK = FK

 
 Select Stud.St_Fname + ' ' + Stud.St_Lname as [StudentName], Super.St_Fname + ' ' + Super.St_Lname
 From Student Stud inner join Student Super
 On Super.St_Id = Stud.St_super -- PK = FK


 Select Stud.St_Fname + ' ' + Stud.St_Lname as [StudentName], Super.St_Fname + ' ' + Super.St_Lname
 From Student Stud left join Student Super
 On Super.St_Id = Stud.St_super -- PK = FK

 ----------------------------------------------------------

 -- Multiple Table Join : 

 Select S.St_Fname,S.St_Address , C.Crs_Name, SC.Grade
 From Student S, Stud_Course SC, Course C
 Where S.St_Id = SC.St_Id And C.Crs_Id = SC.Crs_Id -- PK = FK

  Select S.St_Fname,S.St_Address , C.Crs_Name, SC.Grade
 From Student S, Stud_Course SC, Course C
 Where S.St_Id = SC.St_Id And C.Crs_Id = SC.Crs_Id And S.St_Address = 'Cairo'


 Select S.St_Fname,S.St_Address , C.Crs_Name, SC.Grade
 From 
 Student S join Stud_Course SC
 On S.St_Id = SC.St_Id
	join Course C
 On C.Crs_Id = SC.Crs_Id 
 Where S.St_Address = 'Cairo'
