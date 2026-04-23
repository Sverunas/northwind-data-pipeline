{{config(materialized='view')}}
SELECT
Country,
uzsakymu_sk,
bendra_suma
FROM{{ref('sales_summary')}}
WHERE bendra_suma>50000
ORDER BY bendra_suma DESC   