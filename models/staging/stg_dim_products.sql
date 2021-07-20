with products as (
    select
        /* Primary key */
        product_id
        
        /* Foreign keys */
        , supplier_id
        , category_id
        
        /* Selected columns in prod tables */
        , product_name
        , unit_price
        , units_in_stock
        , quantity_per_unit
        ,   case
                when discontinued = 1 then True
                else False
            end as is_discontinued
        
        /* Columns to skip in prod tables */
        , reorder_level
        , units_on_order
        , discontinued
    from {{ source('northwind_db', 'public_products')}}
)

select * from products