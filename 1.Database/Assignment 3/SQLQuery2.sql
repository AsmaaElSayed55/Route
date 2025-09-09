-- Asmaa El Sayed 
/*
Sales Office Database Schema SQL Code
*/

-- Create ( Database | Database object )
Create database Session_3
---------------------------------------------
use Session_3

Create Table [Owner]
(
-- identity(start,step)
Id int primary key identity(1,1),
[Name] varchar(50) not null,
)

Create Table Employee
(
-- identity(start,step)
Id int primary key identity(1,1),
[Name] varchar(50) not null,
Off_Number int, -- not completed
)

Create Table Sales_Office
(
Number int primary key identity(1,1),
[Location] varchar(30),
Emp_Id int not null references Employee(Id),
)

Create Table Property
(
Id int primary key identity(1,1),
[Address] varchar(30),
City varchar(20),
[State] varchar(20),
Code varchar(20),
Off_Number int not null references Sales_Office(Number),
)

Create Table Prop_Owner
(
Precent varchar(50),
Own_Id int references Employee(Id),
Prop_Id int references Property(Id),
primary key (Own_Id,Prop_Id)
)

-- Add
ALTER TABLE Employee
ADD CONSTRAINT FK_Off_Number FOREIGN KEY (Off_Number)
REFERENCES Sales_Office (Number);



/*
Musician Database Schema SQL Code
*/

use Session_3

Create Table Musician
(
-- identity(start,step)
Id int primary key identity(1,1),
[Name] varchar(50) not null,
Ph_Number varchar(12),
City varchar(20),
Street varchar(20),
)

Create Table Instrument
(
-- identity(start,step)
[Name] varchar(50) primary key ,
[Key] int,
)

Create Table Album
(
Id int primary key identity(1,1),
Title varchar(30),
[Date] date,
Mus_Id int not null references Musician(Id),
)

Create Table Song
(
Title varchar(30) primary key,
Author varchar(30),
)

Create Table Album_Song
(
Album_Id int references Album(Id),
Song_Title varchar(30) references Song(Title),
primary key (Album_Id,Song_Title)
)

Create Table Mus_Instrument
(
Mus_Id int references Musician(Id),
Inst_Name varchar(50) references Instrument([Name]),
primary key (Mus_Id,Inst_Name)
)

