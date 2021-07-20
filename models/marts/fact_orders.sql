with
    customers as (
        select *
        from {{ ref('dim_customers') }}
    )
    , shippers as (
        select *
        from {{ ref('dim_shippers') }}
    )
    , employees as (
        select *
        from {{ ref('dim_employees') }}
    )
    , prod_orders as (
        select 
            /* Primary key */
            order_id

            /* Foreign keys */
            , customers.customer_sk as customer_fk
            , employees.employee_sk as employee_fk
            , shippers.shipper_sk as shipper_fk

            /* Selected columns in prod tables */
            , orders.order_date
            , orders.ship_postal_code
            , orders.ship_city
            , orders.ship_region
            , orders.ship_country
            , orders.freight
            
            /* Metric columns created from order_details table */
            , orders.total_qtd
            , orders.sales
            , orders.net_sales
            , orders.total_discount
            , orders.unique_itens
        from {{ ref('stg_fact_orders') }} as orders
        left join customers 
        on customers.customer_id = orders.customer_id
        left join shippers 
        on shippers.shipper_id = orders.shipper_id 
        left join employees 
        on employees.employee_id = orders.employee_id 
    )

select * from prod_orders