--------------- Asmaa El Sayed --------------
------------ Part 1 ---------------
---------- Qu 1 ---------------
Select count(St_Age) 
from Student
---------- Qu 2 ---------------
Select Top_name , Count (Crs_id) As 'Number Of Courses'
from Topic T, Course C
where T.Top_Id = C.Top_Id
Group by Top_Name
---------- Qu 3 ---------------
Select St_Id , St_Fname + ' '+ isnull (St_Lname , St_FName) As FullName , D.Dept_Name
from Student S join Department D
on S.Dept_Id = D.Dept_Id
---------- Qu 4 ---------------
Select Ins_name , isnull(Salary,'0000')
from Instructor
---------- Qu 5 ---------------
Select Ins_Name , Count(St_id) As 'Number Of Student'
From Instructor I join Student S
on I.Ins_Id = S.St_super
Group by Ins_Name
---------- Qu 6 ---------------
Select Min(Salary) as Min_Salary ,Max(Salary) as Max_Salary
from Instructor
---------- Qu 7 ---------------
Select Avg(Salary) [ Avrage Of Salary ]
from Instructor
---------- Qu 8 ---------------
Select Top_name , Count (Crs_id) As 'Number Of Courses'
from Topic T, Course C
where T.Top_Id = C.Top_Id
Group by Top_Name
---------- Qu 9 ---------------
Select Ins_Name , Count(St_id) As 'Number Of Student'
From Instructor I join Student S
on I.Ins_Id = S.St_super
Group by Ins_Name
---------- Qu 10 ---------------
Select Ins_Name
from Instructor
where Salary < (Select Avg(Salary) from Instructor)
---------- Qu 11 ---------------
Select Dept_Name
from Instructor I join Department D
on I.Dept_Id=D.Dept_Id
Where Salary = (Select Min(Salary) from Instructor)