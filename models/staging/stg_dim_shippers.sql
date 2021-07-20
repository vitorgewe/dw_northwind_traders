with 
    shippers as (
        select
            /* Primary key */
            shipper_id

            /* Selected columns in prod tables */
            , company_name
            , phone
        from {{ source('northwind_db', 'public_shippers') }}
    )

select * from shippers