--------------- Asmaa El Sayed ----------------
------------ Part 2
-------------- Qu 1
Select S.SalesOrderID , S.ShipDate
from Sales.SalesOrderHeader S
Where S.ShipDate between '2002-07-28' and '2014-07-29'
-------------- Qu 2
Select P.ProductID , P.[Name]
from Production.Product P
Where P.StandardCost < 110.00
-------------- Qu 3
Select P.ProductID , P.[Name]
from Production.Product P
Where P.[Weight] is null
-------------- Qu 4
Select *
from Production.Product P
Where P.Color in('Silver','Black','Red')
-------------- Qu 5
Select *
from Production.Product P
Where P.[Name] like 'B%'
-------------- Qu 6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3
-------------- Qu 7
Select *
from Production.Product P join Production.ProductDescription D
on P.ProductID = D.ProductDescriptionID
Where D.[Description] = 'Chromoly steel_High of defects'
-------------- Qu 8
Select Distinct E.HireDate
from HumanResources.Employee E join HumanResources.EmployeeDepartmentHistory D
on E.BusinessEntityID = D.BusinessEntityID
-------------- Qu 9
SELECT 
    'The ' + P.Name + ' is only! ' + CAST(P.ListPrice AS VARCHAR) AS Product_Info
FROM 
    Production.Product P
WHERE 
    P.ListPrice BETWEEN 100 AND 120
ORDER BY 
    P.ListPrice;