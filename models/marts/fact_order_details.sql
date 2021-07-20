with 
    products as (
        select *
        from {{ ref('dim_products') }}
    )
    , prod_order_details as (
        select
            /* Primary key */
            order_details.order_id

            /* Foreign key */
            , products.product_sk as product_fk

            /* Selected columns in prod tables */
            , order_details.unit_price
            , order_details.quantity
            , order_details.discount
            , order_details.total_item
            , order_details.net_total_item
        from {{ ref('stg_fact_order_details') }} as order_details
        left join products
        on products.product_id = order_details.product_id
    )

select * from prod_order_details