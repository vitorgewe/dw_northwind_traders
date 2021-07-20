with 
    prod_customers as (
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
        from {{ ref('stg_dim_customers')}}
    )
    , transformed_key as (
        select
            row_number() over (order by customer_id) as customer_sk
            , *
            from prod_customers
    )

select * from transformed_key