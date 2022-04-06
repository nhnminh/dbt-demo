
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ 
    config(materialized='table') 
}}

select c.id, o.order_date, o.status, p.payment_method, p.amount
from {{ ref('stg_customers') }} c
join {{ ref('stg_orders') }} o
    on c.id = o.user_id
join {{ ref('stg_payments') }} p
    on o.id = p.order_id

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
