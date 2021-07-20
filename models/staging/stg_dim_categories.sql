with categories as (
    select
        /* Primary key */
        category_id

        /* Selected columns in prod tables */
        , category_name

        /* Columns to skip in prod tables */
        , description
        , picture
    from {{ source('northwind_db', 'public_categories' )}}
)

select * from categories