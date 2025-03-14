select CONCAT(order_id,"_", item_id) AS order_item_id,
  order_id, 
  item_id, 
  product_id,
  quantity AS item_quantity,
  list_price AS item_price,
  discount,
  quantity * list_price * (1 - discount) total_order_item_amount
from {{ source('localbike__database', 'order_items') }}
