with 
    employees as (
        select
            /* Primary key */
            employee_id

            /* Selected columns in prod tables */
            , concat(first_name, last_name) as full_name

            /* Columns to skip in prod tables */
            , first_name
            , last_name
            , city
            , postal_code
            , country
            , title
            , title_of_courtesy
            , birth_date
            , hire_date
            , address
            , region  
            , home_phone		
            , extension
            , photo
            , notes
            , reports_to
            , photo_path
        from {{ source('northwind_db', 'public_employees') }}
    )

select * from employees