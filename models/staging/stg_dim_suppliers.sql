with suppliers as (
    select
        /* Primary key */
        supplier_id
        , company_name
        , contact_name
        , contact_title
        , address
        , city
        , region
        , postal_code
        , country
        , phone
        , fax
        , homepage
    from {{ source('northwind_db', 'public_suppliers')}}
)

select * from suppliers