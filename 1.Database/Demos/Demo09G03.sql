-- Revision:
-- 1. Stored Procedure
-- DB Objects 
-- layer 
-- Benefits Of SP:
-- 1. Improved Performance 
-- 2. Stronger Security (Hide Metadata)
-- 3. Reduce Server Network Traffic
-- 4. Hide Business Rules
-- 5. Error Handling
-- 6. Accept Input And Output Parameter
-- Query Life Cycle

-- Trigger : 

------------------------------------------------------------
-- TCL:
-- 1. DDL
-- 2. DML
-- 3. DQL
-- 4. DCL
-- 5. TCL
USE ITI

-- TCL : 
-- 1. Implicit Transaction [DML => Insert , Update, Delete]

Insert Into Student(St_Id, St_Fname, St_Address)
Values(30,'Ahmed', 'Cairo')


-- 2. Explicit Transaction [Set Of Implicit Transaction]


Create Table Parent
(
	ParentId int primary key
)


Create Table Child
(
	ChildId int primary key,
	ParentId int references Parent(ParentId)
)

-- Implicit Transaction
Insert Into Parent
Values (1), (2), (3) 



-- Explicit Transaction

Begin Transaction
	Insert Into Child Values(1,1)
	Insert Into Child Values(2,2)
	Insert Into Child Values(3,3)
Commit Transaction


-- Implicit Transaction
Insert Into Parent
Values (11), (12), (13) 


Begin Try
	Begin Transaction
		Insert Into Child Values(11,11)
		Insert Into Child Values(12,12) 
		Insert Into Child Values(13,13) 
		Insert Into Child Values(14,14)
		Insert Into Child Values(15,19)
		Insert Into Child Values(16,16)
	commit Transaction
End Try
Begin Catch 
	Rollback Transaction
End Catch

-- Index

-- BST :

Create Clustered Index IX 
On Student(St_FName)



-- DCL : 
-- Permission

-- Schema

Create Schema HR

Alter Schema HR
Transfer Department


Alter Schema HR
Transfer Student



