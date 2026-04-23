{{config(materialized='table')}}

-- models/sales_summary.sql
SELECT 
    c.Country,
    COUNT(DISTINCT o.OrderID) AS uzsakymu_sk,
    SUM(od.Quantity * od.UnitPrice) AS bendra_suma,
    AVG(od.UnitPrice) AS vidurkis
FROM {{ source('northwind', 'customers') }} c
JOIN {{ source('northwind', 'orders') }} o 
    ON c.CustomerID = o.CustomerID
JOIN {{ source('northwind', 'order_details') }} od 
    ON o.OrderID = od.OrderID
GROUP BY c.Country
ORDER BY bendra_suma DESC