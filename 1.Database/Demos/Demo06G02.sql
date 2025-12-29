
-- Functions : Block Of Query

-- Types Of Functions In DB:
-- 1. Scalar Functions      : Return Just Only One Value
-- 2. Table-Value Functions : Return Table


-- User-Defined Functions
-- Built-in Functions


----------------------------------------------------------------------------

-- 1. SubQuery:
-- Output Of SubQuery Used As Input To Another Query [Outer Query]


USE ITI

Select Avg(St_Age)
From Student -- 26


Select St_Id, St_Fname, St_Age
From Student
Where St_Age > 26




-- Outer Query
Select St_Id, St_Fname, St_Age
From Student
Where St_Age > (Select Avg(St_Age)From Student) -- SubQuery (Inner Query)

-- NOTE : SubQuery Will Execute First


Select St_Id, St_Fname, St_Age
From Student
Where St_Age > Avg(St_Age) -- Invalid

-- Having Work With Group
-- Where Work With Record


Select St_Id, St_Fname, St_Age
From Student
Having  Avg(St_Age) < St_Age -- Invalid





-- 1 | 19
-- 2 | 19
-- 3 | 19

Select Count(*)
From Student -- 19


Select St_Id, COUNT(*)
From Student -- Invaid


-- Outer Query
Select St_Id, (Select Count(*)From Student) -- SubQuery (Inner Query)
From Student


Select Distinct Dept_Id
From Student
Where Dept_Id is not null


Select Dept_Name
From Department
Where Dept_Id = 10 Or Dept_Id = 20 Or Dept_Id = 30 Or Dept_Id = 40

Select Dept_Name
From Department
Where Dept_Id in (10,20,30,40)



Select Dept_Name
From Department
Where Dept_Id in (Select Distinct Dept_Id
					From Student
					Where Dept_Id is not null)



Select Distinct D.Dept_Name
From Student S, Department D
Where D.Dept_Id = S.Dept_Id -- PK = FK


-- Best Parctice For This Example Using Join 


Select S.St_Fname, Sc.Grade, S.St_Address
From Student S, Stud_Course Sc
Where s.St_Id = SC.St_Id And S.St_Address = 'Mansoura'


Delete From SC
From Student S, Stud_Course Sc
Where s.St_Id = SC.St_Id And S.St_Address = 'Mansoura'






Select S.St_Id,S.St_Fname, Sc.Grade, S.St_Address
From Student S, Stud_Course Sc
Where s.St_Id = SC.St_Id And S.St_Address = 'Cairo'


Delete From Stud_Course
Where St_Id in (Select St_Id
				From Student
				Where St_Address = 'Cairo')


Select St_Id
From Student
Where St_Address = 'Cairo'



Select Max(Salary)
From Instructor -- 323423.00

Select * 
From Instructor
Order By Salary desc

-- 232324.00
Select Max(Salary)
From Instructor
Where Salary != (Select Max(Salary)From Instructor)



Select Max(Salary)
From Instructor
Where Salary != (Select Max(Salary)From Instructor)

-- Id , Name, Salary

Select Ins_Id, Ins_Name,Salary , Max(Salary)
From Instructor
Where Salary != (Select Max(Salary)From Instructor) -- Invalid



Select Top(1) * From
(Select Top(3) Ins_Id, Ins_Name, Salary
From Instructor
Order By Salary Desc) as T
Order By Salary

---------------------------------------------------------------------
-- Ranking Functions
-- Rank ترتيب
-- 1. Row_Number()
-- 2. Dense_Rank()
-- 3. Rank()


Select Ins_Id, Ins_Name, Salary, ROW_NUMBER() over (Order by Salary Desc) as RN
From Instructor


Select Ins_Id, Ins_Name, Salary, Dense_Rank() over (Order by Salary Desc) as RN
From Instructor


Select Ins_Id, Ins_Name, Salary, Rank() over (Order by Salary Desc) as RN
From Instructor




-----------------------------------------------------------------------

-- Using Top

Select Top(2) St_Id, St_Fname, St_Age
From Student
Order By St_Age Desc

-- Using Ranking

Select St_Id, St_Fname, St_Age, ROW_NUMBER()  Over (Order by St_Age Desc) as RN
From Student
Where RN <= 2 -- Invalid



Select * From
(Select St_Id, St_Fname, St_Age, ROW_NUMBER()  Over (Order by St_Age Desc) as RN
From Student) as T
Where RN <= 2


-- Using Top
Select Top(1) * From

(Select Top(5) St_Id, St_Fname, St_Age
From Student 
Where St_Age is not null
Order By St_Age ) as T

ORder By St_Age Desc




Select * From

(Select St_Id, St_Fname, St_Age, ROW_NUMBER() over (Order By St_Age) as RN
From Student
Where St_Age is not null) as T

 Where RN = 5




 Select * From

(Select St_Id, St_Fname, St_Age, Rank() over (Order By St_Age) as RN
From Student
Where St_Age is not null) as T

 Where RN = 5


Select * From

(Select St_Id, St_Fname, St_Age,Dept_Id ,ROW_NUMBER() Over (Partition By Dept_Id Order By St_Age) As RN 
From Student
Where St_Age is not null And Dept_Id is not null) as T

Where RN = 1 




Select Dept_Id, Min(Salary)
FRom Instructor
Group By Dept_Id



Select * From
(Select Ins_Id, Ins_Name, Salary, Dept_Id, ROW_NUMBER() Over (Partition By Dept_Id Order By Salary) as RN
From Instructor) as T
Where RN = 1


---------------------------------------------------------------



-- NTile(int) 

Select Ins_Id, Ins_Name, Salary, NTile(3) Over (ORder By Salary Desc) AS RN
From Instructor

-- 15 / 3 => 5

-- 16 / 3 => 18 / 3 = 6 6 4


-- Execution Order

Select St_Fname + ' ' + St_Lname as FullName
From Student 


Select St_Fname + ' ' + St_Lname as FullName
From Student 
Where FullName = 'Ahmed Hassan' -- Invalid


Select St_Fname + ' ' + St_Lname as FullName
From Student 
Order By FullName -- Valid



Select St_Fname + ' ' + St_Lname as FullName
From Student 
Where St_Fname + ' ' + St_Lname = 'Ahmed Hassan'


-------------------------------------------------------------
-- Union Family
-- Union - Union All - Intersect - Except

-- Union : Get All Value From Two Sets Without Duplication

Select St_Fname From Student 
Union
Select Ins_Name From Instructor


-- Union All : Get All Value From Two Sets With Duplication

Select St_Fname From Student 
Union All
Select Ins_Name From Instructor


-- Intersect : Get Common Value Between Two Sets

Select St_Fname From Student 
Intersect
Select Ins_Name From Instructor

-- Except : Get The Values That Exists In The First Set And Not Exists In The Other Set

Select St_Fname From Student 
Except
Select Ins_Name From Instructor


Select Ins_Name From Instructor
Except
Select St_Fname From Student 



Select St_Fname, St_Age From Student 
Union
Select Ins_Name, Salary From Instructor

-----------------------------------------------------------------
-- Select Into And Insert Based On Select

-- DDL - Structure (Create - Alter - Drop - Select Into)
-- Select Into 

-- Copy Table : Structure With Data
Select * Into NewStudentTable01
From Student


Select St_Id, St_Fname, St_Age Into NewStudentTable02
From Student



-- Copy Table : Structure Without Data


Select St_Id, St_Fname, St_Age Into NewStudentTable03
From Student
Where 1 = 3


Select * Into NewStudentTable04
From Student
Where 1 = 3



-- Insert Based On Select

Insert Into NewStudentTable04
Select * From Student

Insert Into NewStudentTable03
Select St_Id, St_Fname, St_Age From Student

---------------------------------------------------------------



-- Drop Vs Delete Vs Truncate
-- Delete

-- Drop     : DDL Used For Delete Database Or Any DB Objects (Tables, Functions, Views, SP, Triggers, ...)

-- Delete   : DML Used For Delete Row Or More

-- Truncate : DDL Used To Delete Tabel And Re-Create It




