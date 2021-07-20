with order_details as (
    select
        /* Primary key */
        order_id

        /* Selected columns in prod tables */
        , product_id
        , unit_price
        , quantity
        , discount
        , (unit_price * quantity) as total_item
        , (unit_price * quantity) * (1 - discount) as net_total_item
    from {{ source('northwind_db', 'public_order_details' )}}
)

select * from order_details