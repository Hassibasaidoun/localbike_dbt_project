select 
product_id,
product_name,
brand_id,
category_id,
model_year,
list_price
from {{ source('localbike__database', 'products') }}