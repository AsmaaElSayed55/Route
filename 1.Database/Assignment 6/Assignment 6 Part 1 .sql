-------------- Asmaa El Sayed ----------------
------------ Part 1
-------------------- iti Queries

--------------- Qu 1
Select *
From Instructor 
Where Salary <(Select AVG(Salary) From Instructor Where Salary is not null)
--------------- Qu 2
Select D.Dept_Name
from Department D join Instructor I
on D.Dept_Id = I.Dept_Id
where I.Salary =
(Select Min(Salary)
from Instructor Where Salary is not null)
--------------- Qu 3
Select Top(2) Salary ' Max Two Salaries '
from Instructor
order by Salary Desc
--------------------- My Company Queries
--------------- Qu 4
Select D.*
from  Employee E join Departments D
on E.Dno = D.Dnum
Where E.SSN = (Select Min(SSN) from Employee)
--------------- Qu 5
Select Manager.Lname
from Departments Dept join Employee Manager
on Manager.SSN = Dept.MGRSSN 
left join [Dependent] D
ON Manager.SSN = D.ESSN
where D.ESSN is null
--------------- Qu 6
Select D.Dnum , D.Dname , Count(E.SSN) 'Employee Count'
from Departments D join Employee E
on D.Dnum = E.Dno
Group by D.Dnum , D.Dname
Having AVG(Salary) < (Select Avg(Salary) from Employee )
--------------- Qu 7
Select Salary
from Employee
where Salary in (Select Top(2) Salary from Employee)
--------------- Qu 8
Select SSN ,Fname 
from Employee E join [Dependent] D
on E.SSN = D.ESSN
where Exists( Select 1 from [Dependent] D  Where D.ESSN=E.SSN)
--------------- Qu 9
Select Salary
from (Select Salary , ROW_NUMBER() over(order by Salary Desc ) RN
from Employee
where Salary is not null ) As RN
where RN in (1,2)
--------------- Qu 10
Select * from
(Select *
NTile(1) over (order by Salary Desc) As Level_Num
from Employee) Ranked_Instructors
Where Level_Num=1 