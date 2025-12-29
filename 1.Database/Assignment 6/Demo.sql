--------- Asmaa El Sayed ----------
------------- Demo Session 6 -----------------

----------- Top  
-- return first n rows
-- return first 5 Students from table 
Select Top (5) St_Id , St_Fname , St_Lname
from Student 

-- return last 5 Student 
Select Top (5) St_Id , St_Fname , St_Lname
from Student 
order by St_Id desc

-- return max salary
Select Max(Salary) as Max_Salary
from Instructor 
----------- Using Top 
Select Top (1) Salary as Max_Salary
from Instructor 
order by Salary Desc

-- return The Second Max Salary
---------- Using SubQuery
-- first it give max Salary in Sub Query 
-- Then it give max Salary in rimind values as Second Max Salary
Select Max(Salary) 'Max Second Salary'
from Instructor
where Salary != (Select Max(Salary)from Instructor)

---------- Using Top
Select Top(1)* from
(Select Top(2) Ins_Id,Ins_Name,Salary 
from Instructor
order by Salary Desc ) As asmaa
order by Salary Asc
--------
Select Min(Salary) 'Max Second Salary'
from Instructor
where Salary in (Select top (2) Salary 
from Instructor order by Salary desc)

----------- Top With Ties 
/* 
if there are more than one element 
have the same value in the top elements
he got it it will return them
*/
Select Top(5) with Ties *
from Student
order by St_Age desc

---------------------- Random Selection ----------------------
---------- New Id ( Global Uinversal Id ) ==> Guid
Select NewId()
-----------------
Select St_Fname , NEWID()
from Student 
----------------
Select Top(2)*
from Student 
order by NEWID()


---------------------- Ranking Functions ----------------------
------------ Row Number
Select Ins_Id , Ins_Name, Salary , ROW_NUMBER() over (order by Salary Desc) AS RN
from Instructor

------------ Rank
Select Ins_Id , Ins_Name, Salary , Rank() over (order by Salary Desc) AS R
from Instructor

------------ Dense Rank
Select Ins_Id , Ins_Name, Salary , Dense_Rank() over (order by Salary Desc) AS DRN
from Instructor

-- Get the 2 Older Students At Student_Table
------------ Using Top [ Recommended ]
Select Top(2) St_Id , St_Fname , St_Age
from Student 
order by St_Age Desc

------------ Using Ranking
Select *
from (Select St_Id , St_Fname , St_Age , ROW_NUMBER() over(order by St_Age Desc ) RN
from Student 
where St_Age is not null ) As RN
where RN in (1,2)

-- Get The 5th youngest Student
------ Using Top
-- has SubQuery
Select Top(1)* from
(Select Top(5) St_Id , St_Fname , St_Age 
from Student 
where St_Age is not null
order by St_Age ) As Youngest_Students
order by St_Age Desc

------ Using Ranking
Select * from
(Select St_Id , St_Fname , St_Age , ROW_NUMBER() over (order by St_Age ) As RN
from Student 
where St_Age is not null) As RN
where RN = 5

-- Get The Youngest Student at Each Department
-------- Group by
Select Dept_Id , Min(St_Age) ' Min Age per Department '
from Student 
Group by Dept_Id 

-------- Ranking 
---- Partitain by
Select* from
(Select St_Id , St_Fname ,St_Age , Dept_Id ,
ROW_NUMBER() over( Partition by Dept_Id order by St_Age)  As RN
from student
Where St_Age is not null and Dept_Id is not null ) As RN
Where RN=1

----------------------------
------------ NTile
Select * from
(Select Ins_Id , Ins_Name , Salary,
NTile(3) over (order by Salary Desc) As Level_Num
from Instructor) Ranked_Instructors
Where Level_Num=1

