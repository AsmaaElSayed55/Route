-- Asmaa El Sayed 
/*
Session 4 Demo
*/
----- Data Query Language -----
--- Show data ( Select ) ---
--- Show all data of table ---
select * -- * -> mean all Columns
from Student 
--------------- Show Selected Columns ---------------------
select St_Id , St_Fname , St_Lname
from Student
--------------- Show with Condition ---------------------
select St_Id,St_Fname,St_Lname
from Student
where St_Id=10
------------------
select St_Id,St_Fname,St_Lname
from Student 
where St_Age >=23
--------------- Show with multi Conditions -------------------
select St_Id,St_Fname,St_Lname
from Student 
where St_Age >=23 and St_Age<29
--------------- between and not between key words ---------------------
select St_Id,St_Fname,St_Lname
from Student 
where St_Age between 23 and 29
---------------- not betweem ----------------------
select St_Id,St_Fname,St_Lname
from Student 
where St_Age not between 23 and 29
-------------------- Show Student name as full name ---------------------------------------
-------------------- Concutnation ------------------
select St_Id , St_Fname + ' '+ St_Lname as FulName
from Student
where St_Address = 'Cairo' or St_Address='Alex'
---------------------------------
select St_Id , St_Fname + ' '+ St_Lname as FulName
from Student
where St_Address in('Cairo','Alex','Mansora')
---------------- not in ----------------
select St_Id , St_Fname + ' '+ St_Lname as FulName
from Student
where St_Address not in('Cairo','Alex','Mansora')

------------- data is null in any table --> how to get it ------------
select *
from Student
where St_super is null
---------------------- not null --------------------
select *
from Student
where St_super is not null
----------------------------------------------------------------
----------------------------------Like --> Pattern ------------------------------
select St_Id , St_Fname , St_Lname
from Student
where St_Fname like 'a%'

--------------

select St_Id , St_Fname , St_Lname
from Student
where St_Fname like '_a%' -- _a%  ==> mean that FName start with any one Character then (a) ,then zero or more character
------- as the number of index of character ,I choise the number of (_)

select St_Id , St_Fname , St_Lname
from Student
where St_Fname like '[sa]%' --- [sa]% ==> mean that FName start with any character in this range

-------------------------------
select St_Id , St_Fname , St_Lname
from Student
where St_Fname like '[^sa]%' 

----------------------

select St_Id , St_Fname , St_Lname
from Student
where St_Fname like '[^a-h]%'

-----------------------------

select St_Id , St_Fname , St_Lname
from Student
where St_Fname like '%a'  -- ==> mean that end with 'a'

/*
	Wildcard 
	% ==> represent zero or more Character 
	_ ==> one Character
	[] ==> match any single character within this range   
	[^] ==> match any single character not within this range  
	[%] ==> mean that end with this character '%'
	[a-h]% ==> mean that start with any character between (a,h)
	[^a-h]% ==> mean that start with any character not between (a,h)
*/

----------------------------- Not Duplicate ----------------------------------------
select distinct St_Fname
from Student

------------------------------ order by ---------------------------------
select St_Id , St_Fname , St_Lname
from Student
order by St_Fname asc , St_Lname desc

-------------

select St_Id , St_Fname , St_Lname
from Student
order by 2 asc , 3 desc 

----------------

select *
from Student
order by 2 asc , 3 desc

--- asc ==> increasing 
--- dasc ==> decreasing
--- 2,3 ==> Column number
 

 --------------------------------- Join ------------------------------------------
 ------------ Cross Join -------------
 -------- Old Sentax ------------
 Select St_Fname , Dept_Name
 from Student , Department
 -------- New Sentax ---------
 Select St_Fname , Dept_Name
 from Student cross join Department

  ------------ Inner Join -------------
  ------------ old Sentax --------------
 Select St_Id , St_Fname + ' '+ St_Lname as FulName , Dept_Name
 from Student S , Department D
 where D.Dept_Id = S.Dept_Id
 ------------- New Sentax --------------
 Select St_Id , St_Fname + ' '+ St_Lname as FulName , Dept_Name
 from Student S inner join Department D
 on D.Dept_Id = S.Dept_Id   -- On primary key in foregn key table
 where Dept_Name ='SD' -- make the condition alone

 ----- Inner join is the default join -------
 Select *
 from Student S join Department D
 on D.Dept_Id = S.Dept_Id  
 ---------- Check 
 Select *
 from Student S inner join Department D
 on D.Dept_Id = S.Dept_Id  

 ----------------- Outer Join ---------------
 ----------- Left Outer Join ----------
 --- return all records on the left till if it doesn't match with the right 
 Select St_Fname , Dept_Name
 from Student S left outer join Department D
 on D.Dept_Id = S.Dept_Id  

 Select St_Fname , Dept_Name
 from Student S left join Department D
 on D.Dept_Id = S.Dept_Id  
 ----------- right Outer Join ----------
 --- return all records on the right till if it doesn't match with the left 
 Select St_Fname , Dept_Name
 from Student S right outer join Department D
 on D.Dept_Id = S.Dept_Id 
 
 Select St_Fname , Dept_Name
 from Student S right join Department D
 on D.Dept_Id = S.Dept_Id  

 ----------- Full Outer Join ----------
 --- return all records on two Tables
 Select St_Fname , Dept_Name
 from Student S full outer join Department D
 on D.Dept_Id = S.Dept_Id  

 Select St_Fname , Dept_Name
 from Student S full join Department D
 on D.Dept_Id = S.Dept_Id 

 ------------------ Self Join ----------------------
 ---------------- Old Sentax -----------------
 Select Stu.St_Id As Student_Id , Stu.St_Fname As Student_Name , Supervisor.St_Fname As Supervisor_Name
 from Student Stu , Student Supervisor
 where Supervisor.St_Id = Stu.St_super

 ---------------- New Sentax -------------------
 Select Stu.St_Id 'Student Id' , Stu.St_Fname 'Student Name' , Supervisor.St_Fname 'Supervisor Name'
 from Student Stu inner join Student Supervisor
 on Supervisor.St_Id = Stu.St_super
 ----------------------
 Select Stu.* , Supervisor.St_Fname 'Supervisor Name'
 from Student Stu left join Student Supervisor
 on Supervisor.St_Id = Stu.St_super

 ---------------------- Multi Join -------------------
Select St_Fname + ' ' + St_Lname AS FullName , Crs_Name , Grade
from Student S inner join Stud_Course SC   -- multi join
on S.St_Id = SC.St_Id
inner join Course C
on SC.Crs_Id = C.Crs_Id
