------- Asmaa El Sayed -------
--------- Demo 5 -------------
------------------ Built in  Functions ----------------
------------- Aggregate Functions ---------------
------------ Search for all agregate function -----------
---- Count 
---- Sum
---- Avg
---- Max
---- Min

-------- Count ---------
Select count(*) ' Count Of Students ' --- Ails name
from Student  -- by default it will based on primary key --
-------------
Select count(St_LName) ' Count Of Students has Last Name ' --- Ails name
from Student
------- Sum -----------
Select Sum(Salary) as Sum_Of_Salary
from Instructor

------- Avrage --------
Select Avg(Salary) [ Avrage Of Salary ]
from Instructor

-------- Min , Max -----------
Select Max(Salary) ' Max Salary ' , Min(Salary) ' Min Salary '
from Instructor
-----------------
Select Max(Ins_Name) ' Max Name ' , Min(Ins_Name) ' Min Name '
from Instructor

------------------ Group By ------------------
-- used with Aggregate Functions
-- you can not Group by * or PK
-- We Grouping with Repated Value Column
--- Minimum Salary for Each Department

-------- Group by with Min Function --------
Select Dept_Id , Min(Salary) as Min_Salary
from Instructor
Group by Dept_Id

-------------
Select Dept_Id,Count(St_Id) as Number_of_Students
from Student
where Dept_Id is not null and St_Address is not null
Group by Dept_Id , St_Address

-------------- Group by is Not Useful here ------------- 
Select St_Fname , Max(St_Age)
from Student 
Group by St_FName

--------------- Group by with join ----------------
Select S.Dept_Id, D.Dept_Name , Count (St_Id) As Number_of_Students
from Student S ,Department D
where D.Dept_Id = S.Dept_Id --  and Count (St_Id)>3  not valid 
Group by S.Dept_Id,D.Dept_Name
Having Count (St_Id)>3

-----------------------
-- not valid to Search with Condition with Agregate Function
-- because its ouput will come after
Select Sum(Salary) as ' Sum of Salary '
from Instructor
where Count(*)>3
------------------ with Having
Select Sum(Salary) as ' Sum of Salary '
from Instructor
Having Count(*)>3

-- Get Sum Of Salary Of Instructors For Each Department [ which has More than 3 Instructors ]

Select Dept_Id,Sum(Salary) as ' Sum Of Salary '
from Instructor
Group by Dept_Id
Having Count(Ins_Id)>3

 ------------- Null Functions ---------------
 ------------- with Condition --------------- 
 Select St_Lname
 from Student 
 where St_Lname is not null
 ------------- Is Null Function ------------
 ---------- with Replacement -----------
 Select isnull (St_Lname , St_Fname )
 from Student 
 --------------- with More than one Replacement ----------
Select isnull (St_Lname ,isnull (St_address , 'No Name ') )
from Student  -- The Second isnull is Replacement for St_Name 

------------------- Coalesce Function --------------------
Select coalesce (St_Lname , St_address , ' No Name ' )
from Student
-----------------
Select coalesce (St_Lname , St_address , ' ' )
from Student
---------------------
Select isnull (St_Lname ,'') + ' ' + isnull(St_Lname , '' ) as Full_Name
from Student

------------------ DateTime Functions -------------------
------ GetDate
-- return Current Date with 24 Format
Select GetDate() as ' Current  Date '

------ GetutcDate
-- return World Date
Select GetutcDate()

------ Day(parameter)
-- return number of the day
Select Day(getDate())
 
------ DatePart(parameter 1, parameter 2)

ٍSelect DatePart(Day,GetDate())  --- Error ---

------ Month
-- return the month of this date 
Select Month(GetDate())

------ Year
-- return the year of this date 
Select Year(GetDate())
Select DAtePart(year , GetDate() )

------- week 
-- return number of the week of this year
Select DAtePart(week , GetDate() )

----- DateName
Select DateName(month,GetDate()) -- return month name
Select DateName(year,GetDate())

----- IsDate
if isdate ('2009-05-12')=1
	print ' Valid '
	else 
	print ' Not Valid '

------ Eomonth
Select EoMonth(GetDate())
-- return last day in the month

---------------- Conversion Functions -----------------
---------- Convert 
Select St_Fname + ' ' +St_Age as FullInformation
from Student
---- convert age to string data type in only result

------ Convert 
-- Convert from any data type to any data type
-- if it find null , it will not work 
Select St_Fname + ' ' +convert(varchar(20), St_Age ) as FullInformation
from Student

------ Cast
-- Convert from any data type to any data type
-- if it find null , it will not work   
Select St_Fname + ' ' +cast(St_Age as varchar(20)) as FullInformation
from Student

------ Concat [ Not Conversion ]
-- Convert all Parameters to String 
-- even if [null] , will be mapped to Empty String 
Select concat('Sudent name' , St_Fname , 'Student Age' , St_Age )
from Student 

---- put space between them
Select concat_WS(' ' , 'Sudent name' , St_Fname , 'Student Age' , St_Age )
from Student 

--------- 
declare @Today Date=  '2025-06-15'
Select cast(@Today as varchar(20))
Select convert(varchar(20) , @Today)

------- Parse 
-- Convert from String to datetime and Number types
Select parse('Monday,13 December 2001' as datetime2 using 'en-us') -- note

------------------ String Functions -------------------
-------- Substring 
Select Substring('Asmaa',2,3) -- (string work on , index work on , number of leters take it )

-------- Format
Select Format (GetDate(),'dddd','fr')

-------- Lower
-- convert all caracters to Capital case
Select lower('ASMaa')

-------- Upper
-- convert all caracters to Small case
Select Upper('asMaa')

-------- len
-- return number of caracters
Select Len('Asmaa')

-------- Concat 
Select concat('Sudent name' , St_Fname , 'Student Age' , St_Age )
from Student 

-------- Concat with
Select concat_WS(' ' , 'Sudent name' , St_Fname , 'Student Age' , St_Age )
from Student 

-------- ASCII
-- return ASCII code for first caracter
Select ASCII('p')

-------- Left
-- return first n caracters from left
Select Left ('Asmaa',3)

-------- Right 
-- return first n caracters from right
Select Right('Asmaa' , 3)

-------- Left Trim
-- cut Spaces from Left of String 
Select LTrim('  Asmaa')

-------- Right Trim
-- cut Spaces from Right of String 
Select RTrim('  Asmaa ')

-------- Trim
-- cut Spaces from Right and Left of String 
Select Trim('  Asmaa  ')

-------- Replace
-- turn any first character as parameter to the Second caracter as parameter
Select Replace('Asmaa' ,'a' , 'z')

------------------------- Sub Query -------------------------
-- output Of SubQuery [Inner] As Input To Another Query [Outer]
-- subQuery Is Very Slow [ Not Recommended]

-------------------- Not Valid ---------------------
Select St_Id , St_Fname , St_Age
from Student 
where St_Age > Avg(St_Age)

--------------------------------------------
Select St_Id , St_Fname , St_Age
from Student 
where St_Age >(Select Avg(St_Age) From Student)
/*
(Select Avg(St_Age) From Student) --> this is SubQuery 
SQL excuse it first 
then it excuse original Query 
*/
----------------------------------------------
--- Get Department Names That have Students 
-- Using Join
Select distinct D.Dept_Name
from Student S, Department D
where D.Dept_Id = S.Dept_Id

-- Using Sub Query
Select Dept_Name
from Department 
where Dept_Id in 
( Select distinct Dept_Id from Student where Dept_Id is not null )

-----------------------------------------------
---------------- SubQuery With DML ------------------
-- Delete Students Grades Who Are Living In Cairo
