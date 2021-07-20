with 
    suppliers as (
        select
            /* Primary key */
            supplier_id

            /* Selected columns in prod tables */
            , company_name
            , city
            , postal_code
            , region
            , country
            , contact_name
            , phone
            
            /* Columns to skip in prod tables */
            , address
            , fax
            , homepage
            , contact_title
        from {{ source('northwind_db', 'public_suppliers') }}
    )

select * from suppliers