------------- Asmaa El Sayed -------------
------------- Part 2 --------------
---------- Qu 1 -----------
SELECT P.Pname, SUM(W.Hours) AS "Total Hours per Week"
FROM Works_for W
JOIN Project P ON P.Pnumber = W.Pno
GROUP BY P.Pname;
---------- Qu 2 -----------

SELECT Dname , Max(Salary) as 'Max Salary' , Min(Salary) as 'Min Salary' , Avg(Salary) as 'Avarage Salary'
FROM Departments D, Employee E
where D.Dnum =E.Dno
GROUP BY Dname

---------- Qu 3 -----------
-- Display the data of the department which has the smallest employee SSN over all employees' SSN.

Select *
from Departments
where Dnum = (Select Top(1) Dno  
from Employee order by SSN Asc)

---------- Qu 4 -----------  not done
--  List the last name of all managers who have no dependents
Select Lname
from Departments D join Employee E 
on E.SSN = D.MGRSSN
join [Dependent] Dep on Dep.ESSN = E.SSN
where Dep.ESSN is null

---------- Qu 5 -----------
--  For each department-- if its average salary is less than the average salary of all employees displays its number, name and number of its employees.


---------- Qu 6 -----------
-- Try to get the max 2 salaries using subquery.

ٍSelect Top(2) 
from (Select Salary from Employee order by Salary Desc )

---------- Qu 5 -----------
--  Display the employee number and name if he/she has at least one dependent (use exists keyword) self-study.


