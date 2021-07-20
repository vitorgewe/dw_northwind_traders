with 
    sum_qtd as (
        select
            sum(total_qtd) as qnd
        from {{ ref('fact_orders') }}
        where order_date between '1998-03-01' and '1998-03-31'
    )

select * from sum_qtd where qnd != 4065