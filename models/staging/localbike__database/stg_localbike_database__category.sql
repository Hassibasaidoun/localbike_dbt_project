select 
category_id,
category_name
from {{ source('localbike__database', 'categories') }}
