-- Asmaa El Sayed
------------------- Part 1 -------------------

---------- Qu 1 ------------
Select *
from Employee
---------- Qu 2 ------------
Select Fname , Lname , Salary , Dno
from Employee
---------- Qu 3 ------------
Select Pname , Plocation , Dnum
from Project
---------- Qu 4 ------------
Select CONCAT (Fname , ' ' , Lname ) AS FullName ,  (Salary * 12 * 0.10) AS AnnualComm
from Employee
---------- Qu 5 -------------
Select SSN, Fname + ' ' + Lname AS FullName
from Employee
where Salary > 10000;
---------- Qu 6 -------------
Select SSN, Fname + ' ' + Lname AS FullName
from Employee
where Salary * 12 > 10000;
---------- Qu 7 -------------
Select Fname + ' ' + Lname AS FullName ,Salary
from Employee
where Sex ='F'
---------- Qu 8 -------------
Select Dnum , Dname
from Departments
where MGRSSN = 968574
---------- Qu 9 -------------
Select Pnumber , Pname ,Plocation
from Project
where Dnum = 10


------------------- Part 3 -------------------
---------- Qu 1 -------------
 Select D.Dnum , D.Dname ,E.SSN , E.Fname , E.Lname
 from  Departments D inner join Employee E
 on D.MGRSSN = E.SSN
---------- Qu 2 -------------
Select D.Dname ,P.Pname
from  Departments D inner join Project P
on D.Dnum = P.Dnum
---------- Qu 3 -------------
Select D.* , E.Fname+' '+E.Lname
from  [Dependent] D inner join Employee E
on D.ESSN = E.SSN
---------- Qu 4 -------------
Select Pnumber , Pname , Plocation
from  Project 
where City in ('Cairo' , 'Alex' )
---------- Qu 5 -------------
Select *
from  Project 
where Pname like 'a%'
---------- Qu 6 -------------
Select *
from  Employee 
where Dno=30 and Salary between 1000 and 2000

