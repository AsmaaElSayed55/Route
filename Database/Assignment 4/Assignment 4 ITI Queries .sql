-- Asmaa El Sayed
----------------------- Part 2 ------------------------- 

------------ Qu 1 ------------
select distinct Ins_Name
from Instructor
------------ Qu 2 ------------
select Ins_Name ,Dept_Name
from Instructor I left outer join Department D  
on I.Dept_Id=D.Dept_Id
------------ Qu 3 ------------
Select St_Fname + ' ' + St_Lname AS FullName , Crs_Name , Grade
from Student S inner join Stud_Course SC   -- multi join
on S.St_Id = SC.St_Id
inner join Course C
on SC.Crs_Id = C.Crs_Id
------------ Qu 4 ------------
select S.St_Fname ,I.*
from Student S  join Instructor I
on S.St_super=I.Ins_Id
------------ Qu 5 ------------
------------ Inner Join ----------
 Select St_Id , St_Fname + ' '+ St_Lname as FulName , Dept_Name
 from Student S , Department D
 where D.Dept_Id = S.Dept_Id


