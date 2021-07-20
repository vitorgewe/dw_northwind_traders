with 
    prod_suppliers as (
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
        from {{ ref('stg_dim_suppliers')}}
    )
    , transformed_key as (
        select
            /* Creating surrogate key */
            row_number() over (order by supplier_id) as supplier_sk
            , *
            from prod_suppliers
    )

select * from transformed_key