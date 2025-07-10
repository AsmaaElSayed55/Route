-- Asmaa El Sayed 
/*
Session 3 Demo
*/

-- Create ( Database | Database object )
Create database CompanyC44G04
---------------------------------------------
use CompanyC44G04

Create Table Employees
(
-- identity(start,step)
Id int primary key identity(1,1),
FName varchar(20) not null,
LName varchar(10) not null,
[Address] varchar(20) default 'Cairo',
Salary decimal(5,1),
Gender char(1),
BirthDate date,
DepartmentNumber int, -- not created
-- references --> take id in employee table 
Super_Id int references Employees(Id),
)

Create Table Department
(
DNumber int primary key identity(1,1),
DName varchar(50) not null,
[Hiring Date] date,
ManagerId int not null unique,
  Constraint FK_Department_Employees
  foreign key ( ManagerId ) references Employees(Id)
)

Create Table [ Department Loction ]
(
DNumber int references Department(DNumber),
[Location] varchar(30),
   -- coposite key 
   --(2 primary key as compsite key )
primary key(DNumber,[location])

)

Create Table Projects
(
PNumber int primary key identity(1,1),
PName varchar(20) not null,
[Location] varchar(30),
City varchar(30),
DNumber int not null references Department(DNumber),

)
Create Table [Dependent]
(
DName varchar(20) not null,
BirthDate date,
Gender char(1),
Emp_Id int references Employees(Id),
primary key (DName,Emp_Id)
)
Create Table [Employee Projects]
(
Emp_Id int references Employees(Id),
ProjectNo int references Projects(PNumber),
Working_Hours int,
primary key (Emp_Id,Working_Hours)
)
-- Alter
Alter Database CompanyC44G04
Modify Name=Test
------------  Alter on Tables ---------------
-- Add
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Department FOREIGN KEY (DepartmentNumber)
REFERENCES Department (DNumber);

---- Add new colunm ---
Alter Table Employees 
Add NetSalary int 

-- Alter


-- Drop
Drop database CompanyC44G04
Drop Table Employees