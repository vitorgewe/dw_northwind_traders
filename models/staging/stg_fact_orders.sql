with orders as (
    select*
    from {{ source('northwind_db', 'public_orders') }}
)

, order_details as (
    select *
    from {{ ref('stg_fact_order_details') }}
)

, metrics as (
    select
    /* Metric columns created from order_details table */
        order_id
        , sum(quantity) as total_qtd
        , sum(unit_price * quantity) as sales
        , sum(unit_price * (1 - discount) * quantity) as net_sales
        , sum(unit_price * quantity) - sum(unit_price * (1 - discount) * quantity) as total_discount
        , count(distinct product_id) as unique_itens
        from order_details
        group by order_id
)

, joined_orders as (
    select 
        /* Primary key */
        orders.order_id

        /* Foreign keys */
        , orders.customer_id
        , orders.employee_id
        , orders.ship_via as shipper_id

        /* Selected columns in prod tables */
        , orders.order_date
        , orders.ship_postal_code
        , orders.ship_city
        , orders.ship_region
        , orders.ship_country
        , orders.freight
        
        /* Metric columns created from order_details table */
        , metrics.total_qtd
        , metrics.sales
        , metrics.net_sales
        , metrics.total_discount
        , metrics.unique_itens
        
        /* Columns to skip in prod tables */
        , orders.ship_name
        , orders.ship_address
        , orders.required_date
        , orders.shipped_date
    from orders
    left join metrics
    on orders.order_id = metrics.order_id
)

select * from joined_orders