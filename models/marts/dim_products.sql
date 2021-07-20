with 
    categories as (
        select *
        from {{ ref('stg_dim_categories') }}
    )
    , suppliers as (
        select *
        from {{ ref('dim_suppliers') }}
    )
    , prod_products as (
        select
            /* Primary key */
            products.product_id
            
            /* Degenerated dimensions */
            , suppliers.company_name
            , categories.category_name
            
            /* Selected columns in prod tables */
            , products.product_name
            , products.unit_price
            , products.units_in_stock
            , products.quantity_per_unit
            , products.is_discontinued
        from {{ ref('stg_dim_products') }} as products
        left join categories
        on categories.category_id = products.category_id
        left join suppliers
        on suppliers.supplier_id = products.supplier_id
    )
    , transformed_key as (
        select
            /* Creating surrogate key */
            row_number() over (order by product_id) as product_sk
            , *
            from prod_products
    )

select * from transformed_key