
-- Use the `ref` function to select from other models

select  payment_method,
        sum(amount) as amount,
        count(id) as nb_order
from {{ ref('fact_orders') }}
group by payment_method
order by amount DESC
limit 5

