with customers as (
    select
        /* Primary key */
        customer_id

        /* Selected columns in prod tables */
        , company_name
        , contact_name
        , city
        , region
        , postal_code
        , country
        , phone

        /* Columns to skip in prod tables */
        , contact_title
        , address
        , fax
    from {{ source('northwind_db', 'public_customers')}}
)

select * from customers