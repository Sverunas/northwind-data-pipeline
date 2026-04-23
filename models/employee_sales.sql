{{config(materialized='table')}}
SELECT 
e.FirstName,
e.LastName,
COUNT(DISTINCT o.OrderID) AS uzsakymu_sk,
SUM(od.Quantity * od.UnitPrice) AS bendra_suma
FROM {{source('northwind', 'employees')}} e
JOIN{{source('northwind', 'orders')}} o
ON e.EmployeeID = o.EmployeeID
JOIN{{source('northwind', 'order_details')}} od
ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY bendra_suma DESC
