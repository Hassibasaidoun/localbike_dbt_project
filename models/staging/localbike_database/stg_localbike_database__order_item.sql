select 
item_id,
order_id,
product_id,
quantity,
discount,
list_price 
from {{ source('localbike_database', 'order_item') }}
