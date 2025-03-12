select
   customer_id,
   order_date,
   order_id,
   order_status,
   required_date,
   case when shipped_date = 'NULL' THEN null else shipped_date end as shipped_date,
   staff_id,
   store_id
from {{ source('localbike__database', 'orders') }}
