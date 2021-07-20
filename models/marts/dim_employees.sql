with 
    prod_employees as (
        select
            /* Primary key */
            employee_id

            /* Selected columns in prod tables */
            , first_name
            , last_name
            , full_name
            , city
            , postal_code
            , country
            , title

        from {{ ref('stg_dim_employees') }}
    )
    , transformed_key as (
        select
            /* Creating surrogate key */
            row_number() over (order by employee_id) as employee_sk
            , *
            from prod_employees
    )

select * from transformed_key