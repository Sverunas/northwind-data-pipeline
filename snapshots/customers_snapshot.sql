{% snapshot customers_snapshot %}

{{
    config(
        target_schema='northwind',
        unique_key='CustomerID',
        strategy='check',
        check_cols=['ContactName', 'Address', 'City', 'Country']
    )
}}

SELECT
    CustomerID,
    CompanyName,
    ContactName,
    Address,
    City,
    Country
FROM {{ source('northwind', 'customers') }}

{% endsnapshot %}