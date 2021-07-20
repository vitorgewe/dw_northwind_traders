with 
    prod_shippers as (
        select
            /* Primary key */
            shipper_id

            /* Selected columns in prod tables */
            , company_name
            , phone
        from {{ ref('stg_dim_shippers' )}}
    )
    , transformed_key as (
        select
            /* Creating surrogate key */
            row_number() over (order by shipper_id) as shipper_sk
            , *
            from prod_shippers
    )

select * from transformed_key